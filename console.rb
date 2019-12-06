require_relative('models/star')
require_relative('models/movie')
require_relative('models/casting')

require('pry')

Casting.delete_all()
Star.delete_all()
Movie.delete_all()

binding.pry
nil
