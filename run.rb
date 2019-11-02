require 'pry'
require_relative 'owner'
require_relative 'dog'
require_relative 'cat'

jonah = Owner.new("jonah")

felix = Cat.new("felix", "jonah")
fifi = Cat.new("felix", "triona")

#binding.pry 

