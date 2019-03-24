require_relative('../db/sql_runner')

class Stamp

  attr_reader :id, :catagory

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @catagory = options['catagory']
  end

  def save()
    sql = 'INSERT INTO stamps (catagory)
          VALUES ($1)
          RETURNING id'
    values = [@catagory]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM stamps'
    results = SqlRunner.run(sql)
    results.map { |stamp| Stamp.new(stamp) }
  end

  def self.find(id)
    sql = 'SELECT * FROM stamps
          WHERE id = $1'
    values = [id]
    results = SqlRunner.run(sql, values)
    return Stamp.new(results.first)
  end

  def update
    sql = 'UPDATE stamps
          SET catagory = $1
          WHERE id = $2'
    values = [@catagory, @id]
    results = SqlRunner.run(sql, values)
  end

  def self.destroy(id)
    sql = 'DELETE FROM stamps
          WHERE id = $1'
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM stamps'
    results = SqlRunner.run(sql)
  end

  def merchant_check()
    sql = "SELECT m.* FROM merchants m INNER JOIN transactions t ON t.merchant_id = m.id WHERE t.stamp_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |merchant| Merchant.new(merchant) }
  end
end
