require_relative ('../db/sql_runner')

class Customer

attr_reader :id 
attr_accessor :name, :funds

def initialize ( options ) 
  @id = options['id'] if options ['id']
  @name = options['name']
  @funds = options['funds'].
end

def delete_all()
  sql = "DELETE FROM Customer"
  SqlRunner.run(sql)


end