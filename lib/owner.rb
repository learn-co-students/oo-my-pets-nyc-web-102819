require 'pry'
class Owner

  attr_reader :name, :species, :cats, :dogs 

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self 
  end 

  def say_species
    "I am a #{@species}."
  end 

  def self.all
    @@all
  end 

  def self.count 
    @@all.count 
  end 

  def self.reset_all
    @@all = []
  end 

  def cats 
    Cat.all.select do |cat|
      cat.owner == self 
    end 
  end 

  def dogs #returnsa a collection of all the dogs that belong to the owner
    Dog.all.select do |dog|
      dog.owner == self 
    end 
  end 

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
     Dog.all.each do |dog|
       dog.mood = "happy"
      end 
  end 

  def feed_cats
    Cat.all.each { |cat| cat.mood = "happy" }
  end 

  def sell_pets
    Cat.all.each { |cat| cat.mood = "nervous" }
    Cat.all.each { |cat| cat.owner = nil }
    Dog.all.each { |dog| dog.mood = "nervous" }
    Dog.all.each { |dog| dog.owner = nil }
  end 

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 


end
#binding.pry


# binding.pry