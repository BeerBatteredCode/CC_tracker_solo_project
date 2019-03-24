require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/stamp.rb')
also_reload('../models/*')

get '/stamps' do
  @stamp_list = Stamp.all()
  erb (:"stamps/index")
end

get '/stamps/:id' do
  @stamp = Stamp.find(params['id'].to_i)
  erb(:"stamps/show")
end
