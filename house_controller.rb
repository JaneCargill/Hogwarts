require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( 'models/house')

#students = Student.all()
#student = Student.find(1)

# binding.pry
# nil

#Show all the houses
get '/houses' do
  @houses = House.all
  if @houses[0] != nil
    erb(:"index_house")
  else
    erb(:none)
  end
end

# #Add a new house
# get '/houses/new' do 
#   erb(:new)
# end

# #create a new house
# post '/houses' do
#   student = House.new( params )
#   house.save()
#   redirect to ('/houses')
# end

# #show a house id
# get '/houses/:id' do
#   @house = House.find( params[:id] )
#   erb(:show)
# end

# #delete a student from the db
# post '/houses/:id/delete' do
#   House.destroy(params[:id])
#   redirect to('/houses')
# end

# #show the edit student form
# get '/students/:id/edit' do
#   @house = House.find( params[:id])
# erb(:edit)
# end

# #update the student edited
# post '/houses/:id' do
# House.update( params )
# redirect to("/houses/#{params[:id]}")
# end

