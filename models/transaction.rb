require_relative('../db/sql_runner')

class Transaction

  attr_accessor :id, :merchant_id, :stamp_id, :budget_id, :charge, :is_charitable, :date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @stamp_id = options['stamp_id'].to_i
    @charge = options['charge'].to_f
    @is_charitable = options['is_charitable']
    @date = options['date'] if options['date']
  end

  def save()
    sql = 'INSERT INTO transactions (merchant_id, stamp_id, charge, is_charitable)
          VALUES ($1, $2, $3, $4)
          RETURNING *'
    values = [@merchant_id, @stamp_id, @charge, @is_charitable]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
    @date = results.first()['date']
  end

  def self.all
    sql = 'SELECT * FROM transactions'
    results = SqlRunner.run(sql)
    results.map { |transaction| Transaction.new(transaction) }
  end

  def self.find(id)
    sql = 'SELECT * FROM transactions
          WHERE id = $1'
    values = [id]
    results = SqlRunner.run(sql, values)
    return Transaction.new(results.first)
  end

  def update
    sql = 'UPDATE transactions
          SET (merchant_id, stamp_id, charge, is_charitable)
          = ($1, $2, $3, $4)
          WHERE id = $5'
    values = [@merchant_id, @stamp_id, @charge, @is_charitable, @id]
    results = SqlRunner.run(sql, values)
  end

  def self.destroy(id)
    sql = 'DELETE FROM transactions
          WHERE id = $1'
    values = [id]
    results = SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM transactions'
    results = SqlRunner.run(sql)
  end

  def merchant_finder()
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [@merchant_id]
    results = SqlRunner.run( sql, values )
    return Merchant.new( results.first )
  end

  def stamp_finder()
    sql = "SELECT * FROM stamps
    WHERE id = $1"
    values = [@stamp_id]
    results = SqlRunner.run( sql, values )
    return Stamp.new( results.first )
  end

  def self.calc_charity_total
    sql = "SELECT * FROM transactions WHERE is_charitable = true"
    results = SqlRunner.run(sql)
    total = 0
    results.each do |result|
      result.charge += total
    end
    return total
  end

end
