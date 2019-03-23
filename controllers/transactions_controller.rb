require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )

get '/transactions' do
  @transaction_list = Transaction.all
  erb ( :"transactions/index" )
end

get '/transactions/new' do
  @merchant_list = Merchant.all
  @tag_list = Tag.all
  erb(:"transactions/new")
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to("/transactions")
end

post '/transactions/:id/delete' do
  Transaction.destroy(params[:id])
  redirect to("/transactions")
end
