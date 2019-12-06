require_relative ('../db/sql_runner')

class Customer

  attr_reader :id 
  attr_accessor :name, :funds

  def initialize ( options ) 
    @id = options['id'].to_i if options ['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  # ========== CREATE ============

  def save()
    sql = "INSERT INTO customers
    (name, funds)
    VALUES($1, $2)
    RETURNING id"
    values = [@name, @funds]
    customer_save = SqlRunner.run(sql, values).first
    @id = customer_save['id'].to_i
  end


# ============= READ =============

  def self.read_all()
    sql = "SELECT * FROM customers"
    customer_records = SqlRunner.run(sql)
    return customer_records.map {|customer_hash| Customer.new(customer_hash)}
  end

  # ========= Update ==================

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) 
    WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
    return values
  end

  # ============= DELETE =============

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end