class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{self.species}."
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def sell_pets
    cats.each do |cat|
      cat.mood = "nervous";
      cat.owner = nil
    end
    dogs.each do |dog|
      dog.mood = "nervous";
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

end