require_relative('models/films')
require_relative('models/customers')
require_relative('models/tickets')

require('pry')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

binding.pry
nil
