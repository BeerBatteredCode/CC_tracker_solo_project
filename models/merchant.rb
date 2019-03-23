require_relative('../db/sql_runner')

class Merchant

  attr_reader :id, :name

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
    sql = "SELECT s.* FROM stamps s INNER JOIN transactions t ON t.stamp_id = s.id WHERE t.merchant_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |stamp| Stamp.new(stamp) }
  end

  # def zombies()
  #   sql = "SELECT z.* FROM zombies z INNER JOIN bitings b ON b.zombie_id = z.id WHERE b.victim_id = $1;"
  #   values = [@id]
  #   results = SqlRunner.run(sql, values)
  #   return results.map { |zombie| Zombie.new(zombie) }
  # end
end
