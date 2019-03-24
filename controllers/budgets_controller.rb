require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/budget.rb')
also_reload('../models/*')

get '/budgets' do
  @budget_list = Budget.all()
  erb ( :"budgets/index" )
end

get '/budgets/:id' do
  @budget = Merchant.find(params['id'].to_i)
  erb( :"budgets/list" )
end
