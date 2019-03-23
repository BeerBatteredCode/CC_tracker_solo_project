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

  def self.all()
    sql = 'SELECT * FROM tags'
    results = SqlRunner.run(sql)
    results.map { |tag| Tag.new(tag) }
  end

  def self.find(id)
    sql = 'SELECT * FROM tags
          WHERE id = $1'
    values = [id]
    results = SqlRunner.run(sql, values)
    return Tag.new(results.first)
  end

  def update
    sql = 'UPDATE tags SET catagory = $1
    WHERE id = $2'
    values = [@catagory, @id]
    results = SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM tags'
    results = SqlRunner.run(sql)
  end
end
