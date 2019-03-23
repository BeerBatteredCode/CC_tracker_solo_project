require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant.rb')
also_reload('../models/*')

get '/merchant' do
  @merchant_list = Victim.all()
  erb ( :"merchant/index" )
end

get '/merchant/:id' do
  @merchant = Merchant.find(params['id'].to_i)
  erb( :"merchants/show" )
end
