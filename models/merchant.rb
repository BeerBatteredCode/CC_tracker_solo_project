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

  def self.delete_all
    sql = 'DELETE FROM merchants'
    results = SqlRunner.run(sql)
  end
end
