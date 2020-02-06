require_relative('../db/sql_runner')

class House

  attr_reader :id, :name, :logo_url

def initialize ( options )
  @id = options['id'].to_i
  @name = options['name']
  @logo_url = options['logo_url']

end

def save
  sql = "INSERT INTO houses
  (
    name,
    logo_url
    )
    VALUES
    (
      $1,$2
    )
    RETURNING id"
    values = [@name, @logo_url]
    @id = SqlRunner.run(sql,values).first['id']
end
end
