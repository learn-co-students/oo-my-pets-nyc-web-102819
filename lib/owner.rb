require 'pry'

class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species ="human"
    @@all << self
    # @cats = []
    # @dogs = []
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats
    # binding.pry
    Cat.all.find_all {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.find_all {|dog| dog.owner == self}
  end

  def buy_cat(new_name)
    # @cat << Cat.new(name, self)
    # binding.pry
    Cat.new(new_name, self)
    # binding.pry
  end

  # def cats
  #   Cat.all
  # end

  def buy_dog(new_name)
    # @dogs << Dog.new(name, self)
    Dog.new(new_name, self)
  end

  def walk_dogs
    owner_dogs = dogs
    owner_dogs.map do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    owner_cats = cats
    owner_cats.map do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    owner_dogs = dogs
    owner_dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    owner_cats = cats
    owner_cats.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    dog_num = dogs.count
    cat_num = cats.count
    "I have #{dog_num} dog(s), and #{cat_num} cat(s)."
  end
  # def dogs
  #   Dog.all
  # end
end

# owner = Owner.new("Dave")

