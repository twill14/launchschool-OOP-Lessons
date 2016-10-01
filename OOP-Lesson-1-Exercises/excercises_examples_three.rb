# class GoodDog
#   def self.what_am_i 
#     "I'm a GoodDog class!"
#   end
# end


# puts GoodDog.what_am_i

# class GoodDog
#   #Class variable 
#   @@number_of_dogs = 0

#   def initialize 
#     @@number_of_dogs += 1
#   end
 
#  #Class method
#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end
# end

# puts GoodDog.total_number_of_dogs

# dog1 = GoodDog.new
# dog2 = GoodDog.new

# puts GoodDog.total_number_of_dogs


# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age = a * DOG_YEARS
#   end
# end


# sparky = GoodDog.new("Sparky", 4)
# puts sparky.age

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     @name = n 
#     @age = a * DOG_YEARS
#   end

#   def to_s
#     "This dog's name is #{name} and it is #{age} in dog years."
#   end
# end

# sparky = GoodDog.new("Sparky", 6)

# puts sparky

# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     self.name = n
#     self.height = h 
#     self.weight = w
#   end

#   def change_info(n, h, w)
#     self.name = n 
#     self.height = h
#     self.weight = w
#   end

#   def info
#     "#{self.name} weighs #{self.weight} and is #{self.height} inches tall"
#   end

#   def what_is_self
#     self
#   end
# end

# sparky = GoodDog.new("Sparky", "12 inches", "10 lbs")

# p sparky.what_is_self

# class GoodDog
#   puts self
# end



############################ Question 1 & 2


# class MyCar 
#   attr_accessor :color, :model
#   attr_reader :year
#   def initialize(y, c, m)
#     @year = y
#     @color = c
#     @model = m
#     @current_speed = 0
#   end

#   def speedup(spd)
#     @current_speed += spd
#     puts "Car is accelerating to #{spd} mph"
#   end

#   def brake(spd)
#     @current_speed -= spd
#     puts "You push the brakes and decelerate by #{spd} mph"
#   end

#   def shutoff
#     @current_speed = 0
#     puts "Car is stopped"
#   end

#   def current_speed
#     puts "You are going #{@current_speed} mph"
#   end

#   def spray_paint(clr)
#     self.color = clr
#     puts "You've colored the car to #{clr}"
#   end

#   def self.calculate_gas_mileage(gas, mileage)
#     puts "This car gets #{gas/mileage} miles to the gallon!"
#   end

#   def to_s
#     puts "You have a beautiful #{self.color} #{self.year} #{self.model}"
#   end
# end

# lumina = MyCar.new(2016, "Red", "Chevy lumina")

# lumina.to_s

################ Question 3

# class Person
#   attr_accessor :name
#   def initialize(name)
#     self.name = name
#   end
# end

# bob = Person.new("Steve")

# bob.name = "Bob"

# p bob.name


# The problem in the question was that the code was trying to set the value of name, in the Person class while name was
# was set as a read-only variable thus could not be written to (only get and not set to).























