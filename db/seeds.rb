require_relative('../models/student')
require_relative('../models/house')

Student.delete_all()

house1 = House.new({
  "name" => "Gryffindor",
  "logo_url" => "/Gryffindor.jpg"
})

house2 = House.new({
  "name" => "Hufflepuff",
  "logo_url" => "/Hufflepuff.jpg"
})

house3 = House.new({
  "name" => "Ravenclaw",
  "logo_url" => "/Ravenclaw.jpg"
})

house4 = House.new({
  "name" => "Slytherin",
  "logo_url" => "/Slytherin.jpg"
})

house1.save
house2.save
house3.save
house4.save

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => house1.id,
  "age" => 12
})
student2 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house_id" => house3.id,
  "age" => 13
})
student3 = Student.new({
  "first_name" => "Hermione",
  "last_name" => "Granger",
  "house_id" => house2.id,
  "age" => 11
})

student1.save
student2.save
student3.save

p student1.house
p student2.house
p student3.house
