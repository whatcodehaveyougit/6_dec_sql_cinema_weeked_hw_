require_relative('../db/sql_runner')
require_relative('./movie.rb')

class Star

    attr_reader :id
    attr_accessor :first_name, :last_name

    def initialize( options )
      @id = options['id'].to_i if options['id']
      @first_name = options['first_name']
      @last_name = options['last_name']
    end


    def self.delete_all()
      sql = "DELETE FROM stars"
      SqlRunner.run(sql)
    end

    def save()
      sql = "INSERT into stars
      ( first_name,
        last_name
        )
        VALUES (
          $1, $2
          ) RETURNING id"
      values = [@first_name, @last_name]
      # Getting the ID Key
      star = SqlRunner.run(sql, values).first
      @id = star['id'].to_i
    end

    def movies()
      # YOU could run after the first line has been written to see all the attendees that have been returned
      sql = "SELECT movies.* FROM movies
      INNER JOIN castings ON castings.movie_id = movies.id WHERE castings.star_id = $1"
      values = [@id]
      results = SqlRunner.run(sql, values)
      return results.map{ |movie_hash| Movie.new(movie_hash) }
    end


end
