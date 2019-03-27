require('sinatra' )
require('sinatra/contrib/all' ) if development?
require('pry-byebug' )
require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require_relative('../models/stamp.rb')
also_reload('../models/*')

#INDEX
get '/transactions' do
  @transaction_list = Transaction.all
  @charity_total = Transaction.calc_charity_total
  erb (:"transactions/index")
end

# CHARITY CASH
get '/transactions/filter' do
  @transaction_list = Transaction.all
  @charity_total = Transaction.calc_charity_total
  erb (:"transactions/index")
end

#NEW
get '/transactions/new' do
  @merchant_list = Merchant.all
  @stamp_list = Stamp.all
  erb(:"transactions/new")
end

#SHOW - TAKES YOU TO INDIVIDUAL TRANSACTIONS
get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/show")
end

#EDIT - EDITS THE ABOVE^ SELECTED ID
get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  @transaction_list = Transaction.all
  @merchant_list = Merchant.all
  @stamp_list = Stamp.all
  erb(:'transactions/edit')
end

get '/transactions/date_finder' do
  @matching_dates = Transaction.find_transaction_date( params[:date])
  erb( :'/transactions/date_finder')
end

#SAVE
post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to("/transactions")
end

#POST UPDATE
post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to "/transactions/#{params[:id]}"
end

#DELETE
post '/transactions/:id/delete' do
  Transaction.destroy(params[:id])
  redirect to("/transactions")
end
