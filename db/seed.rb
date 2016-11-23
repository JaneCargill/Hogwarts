require_relative('../models/student')
require_relative('../models/house')

house1=House.new({
  "name" =>"Gryffindor",
  "logo"=>"http://vignette2.wikia.nocookie.net/harrypotter/images/e/ee/Gryffindor_Crest-0.jpg/revision/latest/scale-to-width-down/162?cb=20160729145529"
  })
house2=House.new({
  "name" =>"Hufflepuff",
  "logo"=>"http://vignette1.wikia.nocookie.net/harrypotter/images/6/62/Download_%289%29.jpg/revision/latest?cb=20160729145653"
  })
house3=House.new({
  "name" =>"Slytherin",
  "logo"=>"http://vignette1.wikia.nocookie.net/harrypotter/images/7/72/Ccd53034-c798-452a-8032-f28e06250d8f.jpg/revision/latest/scale-to-width-down/160?cb=20160729150848&format=webp"
  })
house4=House.new({
  "name" =>"Ravenclaw",
  "logo"=>"http://vignette4.wikia.nocookie.net/harrypotter/images/2/28/Download_%284%29.jpg/revision/latest?cb=20160729145945"
  })
house1.save()
house2.save()
house3.save()
house4.save()


student1 = Student.new({
  "first_name" => "Harry",
  "second_name" => "Potter",
  "house_id" => house1.id,
  "age" => 14
})

student2 = Student.new({
  "first_name" => "Hermione",
  "second_name" => "Granger",
  "house_id" => house1.id,
  "age" => 13
})

student3 = Student.new({
  "first_name" => "Draco",
  "second_name" => "Malfoy",
  "house_id" => house3.id,
  "age" => 15
})


student4 = Student.new({
  "first_name" => "Ernie",
  "second_name" => "Macmillan",
  "house_id" => house2.id,
  "age" => 15
})

student1.save
student2.save
student3.save
student4.save