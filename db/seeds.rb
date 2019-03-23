require_relative('../models/tag')
require_relative('../models/merchant')
require_relative('../models/transaction')
require('pry-byebug')

# Tag.delete_all
# Merchant.delete_all

merchant1 = Merchant.new ({
  'name' => 'Sainsburys'
  })

merchant1.save

tag1 = Tag.new ({
  'catagory' => 'shopping'
  })

tag1.save

transaction1 = Transaction.new ({
  'merchant_id' => merchant1.id,
  'tag_id' => tag1.id,
  'charge' => '55.50',
  })

transaction1.save
