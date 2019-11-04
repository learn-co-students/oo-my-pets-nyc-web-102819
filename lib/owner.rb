class Owner

  attr_reader :name, :species

    @@humans = []

    def initialize(name)
      @name = name
      @species = "human"

      @@humans << self
    end

    def say_species
      return "I am a #{species}."
    end

    def self.all
      @@humans
    end

    def self.count
      self.all.count
    end

    def self.reset_all
      @@humans = []
    end

    def cats 
      Cat.all.select {|cats| cats.owner == self}
    end

    def dogs 
      Dog.all.select {|dogs| dogs.owner == self}
    end

    def buy_cat(name)
      Cat.new(name, self)
    end

    def buy_dog(name)
      Dog.new(name, self)
    end

    def walk_dogs
      dogs.select {|dogs| dogs.mood = "happy"}
    end

    def feed_cats
      cats.select {|cats| cats.mood = "happy"}
    end

    def sell_pets
      dogs.map {|dogs| dogs.mood = "nervous" 
        dogs.owner = nil}
      cats.map {|cats| cats.mood = "nervous" 
        cats.owner = nil}
    end

    def list_pets
      return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    end

end