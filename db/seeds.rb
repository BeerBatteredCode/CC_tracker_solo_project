require_relative('../models/stamp')
require_relative('../models/merchant')
require_relative('../models/transaction')
require('pry-byebug')

Stamp.delete_all
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
merchant4 = Merchant.new ({
  'name' => 'Tesco'
  })
merchant5 = Merchant.new ({
  'name' => 'ASDA'
  })
merchant6 = Merchant.new ({
  'name' => 'Codeclan'
  })
merchant7 = Merchant.new ({
  'name' => 'Chanter'
  })
merchant8 = Merchant.new ({
  'name' => 'Amazon'
  })
merchant9 = Merchant.new ({
  'name' => 'Ebay'
  })
merchant10 = Merchant.new ({
  'name' => 'Apple'
  })
merchant11 = Merchant.new ({
  'name' => 'Steam'
  })
merchant12 = Merchant.new ({
  'name' => 'Vaporized'
  })
merchant13 = Merchant.new ({
  'name' => 'Boots'
  })
merchant14 = Merchant.new ({
  'name' => 'Uber'
  })
merchant15 = Merchant.new ({
  'name' => 'Airbnb'
  })

merchant1.save
merchant2.save
merchant3.save
merchant4.save
merchant5.save
merchant6.save
merchant7.save
merchant8.save
merchant9.save
merchant10.save
merchant11.save
merchant12.save
merchant13.save
merchant14.save
merchant15.save

stamp1 = Stamp.new ({
  'category' => 'Shopping'
  })
stamp2 = Stamp.new ({
  'category' => 'Travel'
  })
stamp3 = Stamp.new ({
  'category' => 'Entertainment'
  })
stamp4 = Stamp.new ({
  'category' => 'Education'
  })
stamp5 = Stamp.new ({
  'category' => 'Holiday'
  })
stamp6 = Stamp.new ({
  'category' => 'Fun'
  })
stamp7 = Stamp.new ({
  'category' => 'Business'
  })
stamp8 = Stamp.new ({
  'category' => 'Girlfriend'
  })
stamp9 = Stamp.new ({
  'category' => 'Hobby'
  })

stamp1.save
stamp2.save
stamp3.save
stamp4.save
stamp5.save
stamp6.save
stamp7.save
stamp8.save
stamp9.save

transaction1 = Transaction.new ({
  'merchant_id' => merchant1.id,
  'stamp_id' => stamp1.id,
  'charge' => '75.55',
  'is_charitable' => false
  })
transaction2 = Transaction.new ({
  'merchant_id' => merchant2.id,
  'stamp_id' => stamp2.id,
  'charge' => '350.25',
  'is_charitable' => false
  })
transaction3 = Transaction.new ({
  'merchant_id' => merchant3.id,
  'stamp_id' => stamp3.id,
  'charge' => '27.27',
  'is_charitable' => true
  })
transaction4 = Transaction.new ({
  'merchant_id' => merchant4.id,
  'stamp_id' => stamp1.id,
  'charge' => '14.57',
  'is_charitable' => false
  })
transaction5 = Transaction.new ({
  'merchant_id' => merchant5.id,
  'stamp_id' => stamp1.id,
  'charge' => '30.22',
  'is_charitable' => false
  })
transaction6 = Transaction.new ({
  'merchant_id' => merchant13.id,
  'stamp_id' => stamp1.id,
  'charge' => '40.27',
  'is_charitable' => true
  })
transaction7 = Transaction.new ({
  'merchant_id' => merchant1.id,
  'stamp_id' => stamp1.id,
  'charge' => '75.55',
  'is_charitable' => false
  })
transaction8 = Transaction.new ({
  'merchant_id' => merchant2.id,
  'stamp_id' => stamp2.id,
  'charge' => '350.25',
  'is_charitable' => false
  })
transaction9 = Transaction.new ({
  'merchant_id' => merchant3.id,
  'stamp_id' => stamp3.id,
  'charge' => '40.27',
  'is_charitable' => true
  })
transaction10 = Transaction.new ({
  'merchant_id' => merchant1.id,
  'stamp_id' => stamp1.id,
  'charge' => '75.55',
  'is_charitable' => false
  })
transaction11 = Transaction.new ({
  'merchant_id' => merchant2.id,
  'stamp_id' => stamp2.id,
  'charge' => '350.25',
  'is_charitable' => false
  })
transaction12 = Transaction.new ({
  'merchant_id' => merchant3.id,
  'stamp_id' => stamp3.id,
  'charge' => '40.27',
  'is_charitable' => true
  })
transaction13 = Transaction.new ({
  'merchant_id' => merchant1.id,
  'stamp_id' => stamp1.id,
  'charge' => '75.55',
  'is_charitable' => false
  })
transaction14 = Transaction.new ({
  'merchant_id' => merchant2.id,
  'stamp_id' => stamp2.id,
  'charge' => '350.25',
  'is_charitable' => false
  })
transaction15 = Transaction.new ({
  'merchant_id' => merchant3.id,
  'stamp_id' => stamp3.id,
  'charge' => '40.27',
  'is_charitable' => true
  })
transaction16 = Transaction.new ({
  'merchant_id' => merchant1.id,
  'stamp_id' => stamp1.id,
  'charge' => '75.55',
  'is_charitable' => false
  })
transaction17 = Transaction.new ({
  'merchant_id' => merchant2.id,
  'stamp_id' => stamp2.id,
  'charge' => '350.25',
  'is_charitable' => false
  })
transaction18 = Transaction.new ({
  'merchant_id' => merchant3.id,
  'stamp_id' => stamp3.id,
  'charge' => '40.27',
  'is_charitable' => true
  })

transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save
transaction6.save
transaction7.save
transaction8.save
transaction9.save
transaction10.save
transaction11.save
transaction12.save
transaction13.save
transaction14.save
transaction15.save
transaction17.save
transaction18.save


# merchant1 = Merchant.new ({
#   'name' => 'Tesco'
#   })
#
# stamp1 = Stamp.new ({
#   'category' => 'extra shopping'
#   })
#
# transaction1 = Transaction.new ({
#   'merchant_id' => merchant1.id,
#   'stamp_id' => stamp1.id,
#   'charge' => '59.50',
#   })
#
# merchant1.update
# stamp1.update
# transaction1.update


check = Transaction.find_transaction_date('2019-03-27')
binding.pry
nil
