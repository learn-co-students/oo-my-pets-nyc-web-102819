class Owner

attr_reader :name, :species
attr_accessor :cat, :dog, :mood

@@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{species}."
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def cats
    Cat.all.select do |cat|
    cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
    dog.owner == self
    end
  end

  def walk_dogs
   dogs.map do |walk|
    walk.mood = "happy"
    end
  end

  def list_pets
   "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def feed_cats
   cats.map do |feed|
    feed.mood = "happy"
   end
  end

  def sell_pets
    cats.map do |pet|
      pet.mood = "nervous"
     end
     dogs.map do |pet|
      pet.mood = "nervous"
    end
    dogs.each do |dog|
      dog.owner = nil
    end
    cats.each do |cat|
      cat.owner = nil
        end
      end
end