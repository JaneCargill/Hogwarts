require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( 'models/house')
require_relative( 'models/student')


#Show all the houses
get '/houses' do
  @houses = House.all
  if @houses[0] != nil
    erb(:"index_house")
  else
    erb(:none)
  end
end


#show a house id
get '/houses/:id' do
  @house = House.find( params[:id] )
  erb(:show_house)
end
