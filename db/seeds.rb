require_relative('../models/budget')
require_relative('../models/stamp')
require_relative('../models/merchant')
require_relative('../models/transaction')
require('pry-byebug')

Stamp.delete_all
Merchant.delete_all
Transaction.delete_all
Budget.delete_all

budget1 = Budget.new ({
  'label' => 'January',
  'total' => '423.42',
  'starting' => '2019-01-13',
  'ending' => '2019-02-13'
  })

budget2 = Budget.new ({
  'label' => 'February',
  'total' => '323.34',
  'starting' => '2019-02-13',
  'ending' => '2019-03-13'
  })

budget3 = Budget.new ({
  'label' => 'March',
  'total' => '389.12',
  'starting' => '2019-03-13',
  'ending' => '2019-04-13'
  })

budget1.save
budget2.save
budget3.save

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

stamp1 = Stamp.new ({
  'category' => 'shopping'
  })
stamp2 = Stamp.new ({
  'category' => 'travel'
  })
stamp3 = Stamp.new ({
  'category' => 'vice'
  })

stamp1.save
stamp2.save
stamp3.save

transaction1 = Transaction.new ({
  'merchant_id' => merchant1.id,
  'stamp_id' => stamp1.id,
  'budget_id' => budget1.id,
  'charge' => '75.55',
  })
transaction2 = Transaction.new ({
  'merchant_id' => merchant2.id,
  'stamp_id' => stamp2.id,
  'budget_id' => budget2.id,
  'charge' => '350.25',
  })
transaction3 = Transaction.new ({
  'merchant_id' => merchant3.id,
  'stamp_id' => stamp3.id,
  'budget_id' => budget3.id,
  'charge' => '40.27',
  })

transaction1.save
transaction2.save
transaction3.save

# budget1 = Budget.new ({
#   'label' => 'February',
#   'total' => '323.42',
#   'starting' => '2019-02-13',
#   'ending' => '2019-02-20'
#   })
#
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
# budget1.update

binding.pry
nil
