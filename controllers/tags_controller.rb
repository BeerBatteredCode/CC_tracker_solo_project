require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/stamp.rb' )
also_reload( '../models/*' )

get '/stamps' do
  @stamp_list = stamp.all()
  erb ( :"stamps/index" )
end

get '/stamps/:id' do
  @stamp = stamp.find(params['id'].to_i)
  erb(:"stamps/list")
end
