########################## Question 1 ###############################

# Everything in ruby is an object


    # p true.class
    # p "hello".class
    # p [1, 2, 3, "happy days"].class
    # p 142.class

########################## Question 2 ###############################

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   include Speed
#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

########################## Question 3 ###############################

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Truck
#   include Speed
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# trck = Truck.new
# trck.go_fast

#Self is referencing the Truck object. This is because when executed, the Truck class is being called first, then the module after.

########################## Question 4 ###############################

# class AngryCat
#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# AngryCat.new

########################## Question 5 ###############################

# class Fruit
#   def initialize(name)
#     name = name
#   end
# end

# class Pizza
#   def initialize(name)
#     @name = name
#   end
# end

# # pizza, because of the "@"name

# hot_pizza = Pizza.new("cheese")
# orange    = Fruit.new("apple")

# p hot_pizza.instance_variables
# p orange.instance_variables


########################## Question 6 ###############################

# class Cube
#   def initialize(volume)
#     @volume = volume
#   end

#   def volume
#     @volume
#   end
# end

# # or

# class Cube
#   attr_reader :volume
#   def initialize(volume)
#     @volume = volume
#   end
# end

########################## Question 7 ###############################

# Default to to provide the object ID (class and encoding)

########################## Question 8 ###############################

# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     self.age += 1
#   end
# end

# # self refers to the instance variable belonging to the object that references that variable. 
# # So when a new Cat object is created, and we call the make_one_year_older method on that object. it will 
# #increment the value of age for that particular Cat object. 

# cat = Cat.new('siameze')
# another_cat = Cat.new('black')

# cat.age = 2
# cat.make_one_year_older

# p cat
# p another_cat

########################## Question 9 ###############################

# class Cat
#   @@cats_count = 0

#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#   end

#   def self.cats_count
#     @@cats_count
#   end
# end

# #In this case, self refers to the Cat Class itself not an individual object created from the cat class.

########################## Question 10 ###############################

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

bag = Bag.new('blue', 'linen')

p bag


















