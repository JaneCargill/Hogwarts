require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( 'models/student')

students = Student.all()
student = Student.find(1)

# binding.pry
# nil

#Show all the pizzas
get '/students' do
  @students = Student.all
  if @students[0] != nil
    erb(:index)
  else
    erb(:none)
  end
end

#Add a new student
get '/students/new' do 
  erb(:new)
end

#create a new student
post '/students' do
  student = Student.new( params )
  student.save()
  redirect to ('/students')
end

#show a student id
get '/students/:id' do
  @student = Student.find( params[:id] )
  erb(:show)
end

#delete a student from the db
post '/students/:id/delete' do
  Student.destroy(params[:id])
  redirect to('/students')
end

#show the edit student form
get '/students/:id/edit' do
  @student = Student.find( params[:id])
erb(:edit)
end

#update the student edited
post '/students/:id' do
Student.update( params )
redirect to("/students/#{params[:id]}")
end

