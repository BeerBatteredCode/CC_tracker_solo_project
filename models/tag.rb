require_relative('../db/sql_runner')

class Tag

  attr_reader :id, :catagory

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @catagory = options['catagory']
  end

  def save()
    sql = 'INSERT INTO tags (catagory)
          VALUES ($1)
          RETURNING id'
    values = [@catagory]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

end
