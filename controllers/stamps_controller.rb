require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/stamp.rb')
also_reload('../models/*')

#INDEX
get '/stamps' do
  @stamp_list = Stamp.all()
  erb (:"stamps/index")
end

#NEW
get '/stamps/new' do
  @stamp_list = Stamp.all
  erb(:"stamps/new")
end

#EDIT
get '/stamps/edit' do
  @stamp_list = Stamp.all
  erb(:"stamps/edit")
end

#SHOW
get '/stamps/:id' do
  @stamp = Stamp.find(params['id'].to_i)
  erb(:"stamps/show")
end

#SAVE
post '/stamps' do
  stamp = Stamp.new(params)
  stamp.save
  redirect to("/stamps")
end

#UPDATE
post '/stamps/:id/edit' do
  stamp = Stamp.new(params)
  stamp.update
  redirect to("/stamps")
end


#DELETE
post '/stamps/:id/delete' do
  Stamp.destroy(params[:id])
  redirect to("/stamps")
end
