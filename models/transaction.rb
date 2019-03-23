require_relative('../db/sql_runner')

class Transaction

  attr_reader :id, :merchant_id, :tag_id, :charge, :date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @charge = options['charge'].to_f
    @date = options[''].to_i if options['date']
  end

  def save()
    sql = 'INSERT INTO transactions (merchant_id, tag_id, charge)
          VALUES ($1, $2, $3)
          RETURNING *'
    values = [@merchant_id, @tag_id, @charge]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
    @date = results.first()['date'].to_i
  end

end
