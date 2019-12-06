require_relative('models/films')
require_relative('models/customers')
require_relative('models/tickets')

require('pry')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


customer1 = Customer.new({'name' => 'John', 'funds' => 200 })
customer1.save()
customer2 = Customer.new({'name' => 'Alex', 'funds' => 300 })
customer2.save()
customer3 = Customer.new({'name' => 'Jimmy', 'funds' => 400 })
customer3.save()

film1 = Film.new({'title' => 'Joker', 'price' => 10 })
film1.save()
film2 = Film.new({'title'=> 'Superman', 'price' => 12 })
film2.save()
film3 = Film.new({'title' => 'Batman', 'price' => 13 })
film3.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id })
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id })
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id })
ticket3.save()


binding.pry
nil
