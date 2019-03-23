require_relative('../models/tag')
require_relative('../models/merchant')
require_relative('../models/transaction')
require('pry-byebug')

Tag.delete_all
Merchant.delete_all
Transaction.delete_all

merchant1 = Merchant.new ({
  'name' => 'Sainsburys'
  })
merchant2 = Merchant.new ({
  'name' => 'Lothian Buses'
  })
merchant3 = Merchant.new ({
  'name' => 'Cross Keys'
  })

merchant1.save
merchant2.save
merchant3.save

tag1 = Tag.new ({
  'catagory' => 'shopping'
  })
tag2 = Tag.new ({
  'catagory' => 'travel'
  })
tag3 = Tag.new ({
  'catagory' => 'vice'
  })

tag1.save
tag2.save
tag3.save

transaction1 = Transaction.new ({
  'merchant_id' => merchant1.id,
  'tag_id' => tag1.id,
  'charge' => '75.55',
  })
transaction2 = Transaction.new ({
  'merchant_id' => merchant2.id,
  'tag_id' => tag2.id,
  'charge' => '350.25',
  })
transaction3 = Transaction.new ({
  'merchant_id' => merchant3.id,
  'tag_id' => tag3.id,
  'charge' => '40.27',
  })

transaction1.save
transaction2.save
transaction3.save

# merchant1 = Merchant.new ({
#   'name' => 'Tesco'
#   })
#
# tag1 = Tag.new ({
#   'catagory' => 'extra shopping'
#   })
#
# transaction1 = Transaction.new ({
#   'merchant_id' => merchant1.id,
#   'tag_id' => tag1.id,
#   'charge' => '59.50',
#   })
#
# merchant1.update
# tag1.update
# transaction1.update

binding.pry
nil
