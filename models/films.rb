require_relative('../db/sql_runner')

class Film

attr_reader :id
attr_accessor :title, :price

def initialize ( options )
  @id = options['id'] if options ['id']
  @title = options['title']
  @price = options['price']
end













end