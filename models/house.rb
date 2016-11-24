require_relative('../db/sql_runner')

class House

  attr_reader( :name, :logo, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @logo = options['logo']
   end

  def save()
    sql = "INSERT INTO houses (
      name,logo) VALUES 
      ('#{ @name }','#{ @logo }') 
      RETURNING *"
    houses = SqlRunner.run(sql)
    @id = houses.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run( sql )
    result = houses.map { |house| House.new( house ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM houses WHERE id=#{id}"
    house = SqlRunner.run( sql )
    result = House.new( house.first )
    return result
  end


  def self.find_id(name)
    sql = "SELECT id from houses WHERE name = #{name}"
    house = SqlRunner.run( sql )
    return House.new( house.first )
  end
  
  def students
    sql = "SELECT s.* FROM houses h 
    INNER JOIN students s
    ON h.id = s.house_id
    WHERE s.house_id = #{@id};"
    return House.get_many(sql)
  end

  def self.get_many(sql)
    houses = SqlRunner.run(sql)
    result = houses.map { |student| Student.new( student ) }
    return result
  end
end
