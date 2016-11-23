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

  def self.update( options )
    sql = "UPDATE houses SET
          name='#{options['name']}',
          logo='#{options['logo']}'
          WHERE id='#{options['id']}'"
    SqlRunner.run( sql )
  end

  def self.find_id(name)
    sql = "SELECT id from houses WHERE name = #{name}"
    house_id = SqlRunner.run( sql )
    return house_id[0]['id'].to_i
  end
  
  def self.destroy( id )
    sql = "DELETE FROM houses WHERE id=#{id}"
    SqlRunner.run( sql )
  end

end
