require_relative('../db/sql_runner')

class Transaction

  attr_reader :id, :merchant_id, :tag_id, :charge, :time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @charge = options['charge'].to_f
    @time = options['time']
  end

  def save()
    sql = 'INSERT INTO transactions (merchant_id, tag_id, charge, time)
          VALUES ($1)
          RETURNING id'
    values = [@merchant_id, @tag_id, @charge, @time]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

end
