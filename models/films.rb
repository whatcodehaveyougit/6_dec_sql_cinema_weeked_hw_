require_relative('../db/sql_runner')

class Film

attr_reader :id
attr_accessor :title, :price

def initialize ( options )
  @id = options['id'].to_i if options ['id']
  @title = options['title']
  @price = options['price']
end

# =========== CREATE =============

def save()
  sql="INSERT INTO films
  (title, price)
  VALUES ($1, $2) 
  RETURNING id"
  values = [@title, @price]
  film_save = SqlRunner.run(sql, values).first
  @id = film_save['id'].to_i
end


# ============ READ ===============

  def self.read_all()
    sql = "SELECT * FROM films"
    films_showing = SqlRunner.run(sql)
    return films_showing.map {|films_hash| Film.new(films_hash)}
  end

# ========== UPDATE ===========

  def update
    sql = "UPDATE films SET (title, price) = ($1, $2)
    WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
      return values
  end



# ============== DELETE ===============

def self.delete_all()
  sql = "DELETE FROM films"
  SqlRunner.run(sql)
end

# def films_customer_has_seen
#   sql = "SELECT * FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = $1"
# end
#   def movies()
#     sql = "SELECT movies.* FROM movies INNER JOIN castings ON movies.id = castings.movie_id WHERE star_id = $1"
#     values = [@id]
#     movie_data = SqlRunner.run(sql, values)
#     return Movie.map_items(movie_data)
#   end












end