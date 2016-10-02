# class Animal
#   attr_accessor :name
#   def initialize(name)
#     @name = name
#   end
#   def speak
#     "Hello!"
#   end
# end


# class GoodDog < Animal
#   attr_accessor :name

#   def initialize(color, name)
#     super(name)
#     @color = color
#   end

#   def speak
#     super + " from GoodDog class!"
#   end
# end

# class BadDog < Animal
#   def initialize(age, name)
#     super(name)
#     @age = age
#   end
# end


# class Cat < Animal
# end


# # sparky = GoodDog.new("Sparky")

# # paws = Cat.new

# # puts sparky.speak

# # puts paws.speak

# p bruno = GoodDog.new("brown", 'Bruno')

#  p BadDog.new(2,"bear")


# module Swimmable 
#   def swim
#     "I'm swimming!"
#   end
# end

# class Animal; end

# class Fish < Animal
#   include Swimmable
# end

# class Mammal < Animal
# end

# class Cat < Mammal
# end

# class Dog < Mammal
#   include Swimmable
# end


# sparky = Dog.new

# neemo = Fish.new

# paws = Cat.new

# puts sparky.swim
# puts neemo.swim
# # paws.swim


# module Walkable
#   def walk
#     "I'm walking."
#   end
# end

# module Swimmable
#   def swim
#     "I'm swimming."
#   end
# end

# module Climbable
#   def climb
#     "I'm climbing."
#   end
# end

# class Animal
#   include Walkable

#   def speak
#     "I'm an animal, and I speak!"
#   end
# end

# class GoodDog < Animal
#   include Swimmable
#   include Climbable
# end


# # puts "---- Animal Method Lookup ----"
# # puts Animal.ancestors

# # fido = Animal.new 

# # p fido.speak

# # p fido.walk

# puts "---- GoodDog Method Lookup ----"
# puts GoodDog.ancestors


# puts Comparable.ancestors


# module Mammal 
#   class Dog
#     def speak(sound)
#       p "#{sound}"
#     end
#   end


#   class Cat
#     def say_name(name)
#       p "#{name}"
#     end
#   end

#   def self.some_out_of_place_method(num)
#     num ** 2
#   end
# end


# buddy = Mammal::Dog.new
# kitty = Mammal::Cat.new

# buddy.speak("Arf!")
# kitty.say_name('Kitty')

# puts value = Mammal.some_out_of_place_method(5)
# puts value = Mammal::some_out_of_place_method(4)


# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age = a
#   end

#   def public_disclosure
#     "#{self.name} in human years is #{human_years}"
#   end

#   private 

#   def human_years
#     age * DOG_YEARS
#   end
# end


# sparky = GoodDog.new("Sparky", 4)
# puts sparky.public_disclosure

# class Animal 
#   def a_public_method
#     "Will this work?" + self.a_protected_method
#   end

#   protected 

#   def a_protected_method
#     "Yes, I'm protected!"
#   end
# end


# boby = Animal.new

# puts boby.a_public_method


# class Parent
#   def say_hi
#     p "Hi from Parent"
#   end
# end


# class Child < Parent
#   def say_hi
#     p "Hi from Child"
#   end

#   def send
#     p "send from Child..."
#   end

#   def instance_of?
#     p "I am a fake instance"
#   end
# end

# # child = Child.new 

# # child.say_hi

# # son = Child.new 

# # son.send :say_hi

# lad = Child.new

# p lad.instance_of? Child

# p lad.instance_of? Parent

######### Questions 1 - 3, 5, 

module Driftable
  def can_drift?(pounds)
    pounds < 1000 ? true : false
  end
end


class Vehicle
  @@number_of_vehicles = 0

  attr_accessor :color, :model
  attr_reader :year
  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.calculate_gas_mileage(gas, mileage)
    puts "This car gets #{gas/mileage} miles to the gallon!"
  end

  def self.count_vehicles
    puts "There are #{@@number_of_vehicles} total vehicles"
  end

  def speedup(spd)
    @current_speed += spd
    puts "Car is accelerating to #{spd} mph"
  end

  def brake(spd)
    @current_speed -= spd
    puts "You push the brakes and decelerate by #{spd} mph"
  end

  def shutoff
    @current_speed = 0
    puts "Car is stopped"
  end

  def current_speed
    puts "You are going #{@current_speed} mph"
  end

  def age 
    "The #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year 
  end
end

class MyCar < Vehicle
  VEHICLE_ID = 7

  def spray_paint(clr)
    self.color = clr
    puts "You've colored the car to #{clr}"
  end
end



class MyTruck < Vehicle
  include Driftable

  VEHICLE_ID = 3
end


# truck = MyTruck.new

# another_truck = MyTruck.new

# car = MyCar.new(2016, "Green", "Ford")

# Vehicle.count_vehicles


############# Question 4

# puts "---Truck---"
# puts MyTruck.ancestors


# puts "---Car---"
# puts MyCar.ancestors

# puts "---Vehicle---"
# puts Vehicle.ancestors



############# Question 5

# buggy = MyCar.new(1940, 'blue', 'mercedes')

# buggy.speedup 20
# buggy.current_speed
# buggy.speedup 10 
# buggy.current_speed
# buggy.brake(15)
# buggy.current_speed
# buggy.brake(15)
# buggy.current_speed
# buggy.shutoff
# buggy.current_speed

# truck = MyTruck.new(2000, 'orange', 'truckytruck')

# puts buggy.age


######## Question 7


# class Student
#   attr_accessor :name

#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end

#   def better_grade_than?(student)
#     grade > student.grade
#   end

#   protected
#   attr_accessor :grade
# end

# jim = Student.new("Jim", 90)
# joe = Student.new("Joe", 85)

# puts "Well done!" if jim.better_grade_than?(joe)


############## Question 8

# "hi" is a private method in the person class. There are a few ways to approach fixing it that depend
# on how the rest of the class leverages the method. 

# The most straight forwards way would be to place the hi method above the private method. 








































