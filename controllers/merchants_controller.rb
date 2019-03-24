require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/merchant.rb')
also_reload('../models/*')

#INDEX
get '/merchants' do
  @merchant_list = Merchant.all()
  erb (:"merchants/index")
end

#NEW
get '/merchants/:id' do
  @merchant = Merchant.find(params['id'].to_i)
  erb(:"merchants/show")
end
