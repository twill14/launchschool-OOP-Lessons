# class Person
#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end
# end


# joe = Person.new("Joe")
# joe.name 


# class Person
#   def initialize
#     @heroes = ['Superman', 'Spiderman', 'Batman']
#     @cash = {'ones' => 12, 'fives' => 2, 'tens' => 0, 'twenties' => 2, 'hundreds' => 0}
#   end

#   def cash_on_hand
#     # Logic
#   end

#   def heroes
#     @heroes.join(', ')
#   end
# end

# joe = Person.new

# joe.cash_on_hand
# joe.heroes


# class Person
#   attr_accessor :name, :pet

#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Robert")
# bud = Bulldog.new

# bob.pet = bud

# bob.pet.class # Bulldog

# bob.pet.speak # "bark!"

class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
    @pet = []
  end
end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets                      # => [#<Cat:0x007fd839999620>, #<Bulldog:0x007fd839994ff8>]












