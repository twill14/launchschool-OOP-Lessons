# class Person
#   def initialize(n)
#     @name = n
#   end

#   def get_name
#     @name
#   end
# end


# bob = Person.new('bob')
# bob.get_name


# class Person
#   @@total_peeps = 0

#   def self.total_peeps
#     @@total_peeps
#   end

#   def intitialize
#     @@total_peeps += 1
#   end

#   def total_peeps
#     @@total_peeps
#   end
# end


# Person.total_peeps
# Person.new
# Person.new
# Person.total_peeps

# bob = Person.new
# bob.total_peeps

# joe = Person.new
# joe.total_peeps

# Person.total_peeps

# class Person
#   TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

#   attr_reader :name

#   def self.TITLES
#     TITLES.join(', ')
#   end

#   def initialize(n)
#     @name = "#{TITLES.sample} #{n}"
#   end
# end

# Person.TITLES

# bob = Person.new('bob')
# bob.name

# module Swim
#   def enable_swimming 
#     @can_swim = true
#   end
# end

# class Dog
#   include Swim

#   def swim 
#     "swimming" if @can_swim
#   end
# end

# teddy = Dog.new
# teddy.swim

# class Dog
#   LEGS = 4
# end

# class Cat 
#   def legs
#     Dog::LEGS
#   end 
# end

# class Vehicle
#   WHEELS = 4
# end

# class Car < Vehicle
#   def self.wheels
#     WHEELS
#   end

#   def wheels 
#     WHEELS
#   end
# end


# Car.wheels 

# a_car = Car.new

# a_car.wheels















