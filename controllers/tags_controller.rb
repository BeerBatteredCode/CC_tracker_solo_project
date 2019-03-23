require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )

get '/tags' do
  @tag_list = Tag.all()
  erb ( :"tag/index" )
end

get '/tags/:id' do
  @tag = Tag.find(params['id'].to_i)
  erb(:"tags/show")
end
