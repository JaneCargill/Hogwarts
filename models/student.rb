require_relative('../db/sql_runner')
require_relative('house')

class Student

  attr_reader( :first_name, :second_name, :house_id, :age, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id']
    @age = options['age'].to_i
  end

  def pretty_name()
    return @first_name.concat(" #{@second_name}")
  end

  def save()
    sql = "INSERT INTO students (
      first_name,second_name,house_id,age ) VALUES 
      ('#{ @first_name }','#{ @second_name }','#{ @house_id }','#{ @age }') 
      RETURNING *"
    student_data = SqlRunner.run(sql)
    @id = student_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run( sql )
    result = students.map { |student| Student.new( student ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM students WHERE id=#{id}"
    student = SqlRunner.run( sql )
    result = Student.new( student.first )

    return result
  end

  def house
    sql = "SELECT * FROM houses WHERE id=#{@house_id}"
    house_data = SqlRunner.run( sql )
    return House.new(house_data.first)
  end

  def self.update( options )
    sql = "UPDATE students SET
          first_name='#{options['first_name']}',
          second_name='#{options['second_name']}',
          house_id='#{options['house_id']}',
          age=#{options['age']}
          WHERE id=#{options['id']}"
    SqlRunner.run( sql )
  end

  def self.destroy( id )
    sql = "DELETE FROM students WHERE id=#{id}"
    SqlRunner.run( sql )
  end


end
