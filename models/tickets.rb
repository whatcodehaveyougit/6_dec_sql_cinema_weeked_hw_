require_relative('..db/sql_runner')

class Ticket

attr_reader :id
attr_accessor :customer_id, :film_id

def initialize ( options )
  @id = options['id'] if options['id']
  @film_id = options['film_id'].to_i
  @customer_id = options['customer_id'].to_i
end


  def delete_all()
    sql = "DELETE FROM Customers"
    SqlRunner.run(sql)
  end










end