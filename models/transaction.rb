require_relative('../db/sql_runner')

class Transaction

  attr_reader :id, :merchant_id, :tag_id, :charge, :date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @charge = options['charge'].to_f
    @date = options['date'].to_i if options['date']
  end

  def save()
    sql = 'INSERT INTO transactions (merchant_id, tag_id, charge)
          VALUES ($1, $2, $3)
          RETURNING *'
    values = [@merchant_id, @tag_id, @charge]
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
          SET (merchant_id, tag_id, charge)
          = ($1, $2, $3)
          WHERE id = $4'
    values = [@merchant_id, @tag_id, @charge, @id]
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

  def tag_finder()
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [@tag_id]
    results = SqlRunner.run( sql, values )
    return Tag.new( results.first )
  end
end
