require_relative('../models/student')
student1 = Student.new({
  "first_name" => "Harry",
  "second_name" => "Potter",
  "house" => "Gryffindor",
  "age" => 14
})

student2 = Student.new({
  "first_name" => "Hermione",
  "second_name" => "Granger",
  "house" => "Gryffindor",
  "age" => 13
})

student3 = Student.new({
  "first_name" => "Draco",
  "second_name" => "Malfoy",
  "house" => "Slytherin",
  "age" => 15
})


student4 = Student.new({
  "first_name" => "Ernie",
  "second_name" => "Macmillan",
  "house" => "Hufflepuff",
  "age" => 15
})

student1.save
student2.save
student3.save
student4.save