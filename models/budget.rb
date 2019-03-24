require_relative('../db/sql_runner')

class Budget

  attr_reader :id, :label, :total, :starting, :ending

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @label = options['label']
    @total = options['total'].to_f
    @starting = options['starting']
    @ending = options['ending']
  end

  def save()
    sql = 'INSERT INTO budgets (label, total, starting, ending)
          VALUES ($1, $2, $3, $4)
          RETURNING id'
    values = [@label, @total, @starting, @ending]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all
    sql = 'SELECT * FROM budgets'
    results = SqlRunner.run(sql)
    results.map { |budget| Budget.new(budget) }
  end

  def self.find(id)
    sql = 'SELECT * FROM budgets
          WHERE id = $1'
    values = [id]
    results = SqlRunner.run(sql, values)
    return Budget.new(results.first)
  end

  def update
    sql = 'UPDATE budgets
          SET label = $1
          WHERE id = $2'
    values = [@label, @id]
    results = SqlRunner.run(sql, values)
  end

  def self.destroy(id)
    sql = 'DELETE FROM budgets
          WHERE id = $1'
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = 'DELETE FROM merchants'
    results = SqlRunner.run(sql)
  end

end
