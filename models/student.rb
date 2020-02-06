require_relative('../db/sql_runner')

class Student

  attr_reader :first_name, :last_name, :house_id, :age, :id

  def initialize( options )
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def pretty_name
    return "#{first_name} #{last_name}"
  end

  def save
    sql = "INSERT INTO students
    (
      first_name,
      last_name,
      house_id,
      age
      )
      VALUES
      (
        $1,$2,$3,$4
      )
      RETURNING id"
      values = [@first_name, @last_name, @house_id, @age]
      @id = SqlRunner.run(sql,values).first['id']
  end

  def house()
    sql = "SELECT name FROM houses
    INNER JOIN students
    ON students.house_id = houses.id
    WHERE students.id = $1"
    values = [@id]
    house_name = SqlRunner.run(sql, values).first['name']
    return house_name
  end

  def delete
    sql = "DELETE FROM students WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    return students.map{ |student| Student.new(student) }
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student_data = SqlRunner.run(sql, values).first
    return Student.new(student_data)
  end


  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

end
