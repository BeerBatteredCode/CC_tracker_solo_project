require_relative('../db/sql_runner')

class Merchant

  attr_accessor :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = 'INSERT INTO merchants (name)
          VALUES ($1)
          RETURNING id'
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all
    sql = 'SELECT * FROM merchants'
    results = SqlRunner.run(sql)
    results.map { |merchant| Merchant.new(merchant) }
  end

  def self.find(id)
    sql = 'SELECT * FROM merchants
          WHERE id = $1'
    values = [id]
    results = SqlRunner.run(sql, values)
    return Merchant.new(results.first)
  end

  def update
    sql = 'UPDATE merchants
          SET name = $1
          WHERE id = $2'
    values = [@name, @id]
    results = SqlRunner.run(sql, values)
  end

  def self.destroy(id)
    sql = 'DELETE FROM merchants
          WHERE id = $1'
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = 'DELETE FROM merchants'
    results = SqlRunner.run(sql)
  end

  def stamp_check()
    sql = "SELECT stamps.* FROM stamps
          INNER JOIN transactions ON transactions.stamp_id = stamps.id
          WHERE transactions.merchant_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |stamp| Stamp.new(stamp) }
  end

  def self.merchant_total
    sql = "SELECT * FROM merchants"
    total = SqlRunner.run(sql).first
    return total.count
  end

end
