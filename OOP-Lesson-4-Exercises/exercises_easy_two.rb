############################# Question 1 #############################

# class Oracle
#   def predict_the_future
#     puts "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# oracle = Oracle.new
# oracle.predict_the_future

############################# Question 2 #############################

# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# class RoadTrip < Oracle
#   def choices
#     ["visit Vegas", "fly to Fiji", "romp in Rome"]
#   end
# end

# trip = RoadTrip.new
# trip.predict_the_future

# Same thing. Roadtrip inherits all methods from the parent class automatically. However, the nuance is that, the 
# choices method was overwritten by the new definition in Roadtrip. So when we call predict_the_future, the sample
# will be selected from choices in Roadtrip and not in the parent class. 
# had we not created a new choices, it would have done exactly the same thing. 


############################# Question 3 #############################
# module Taste
#   def flavor(flavor)
#     puts "#{flavor}"
#   end
# end

# class Orange
#   include Taste
# end

# class HotSauce
#   include Taste
# end

# puts Orange.ancestors

# puts HotSauce.ancestors

############################# Question 4 #############################

# class BeesWax
#   attr_accessor :type
#   def initialize(type)
#     @type = type
#   end

#   def describe_type
#     puts "I am a #{@type} of Bees Wax"
#   end
# end

############################# Question 5 #############################

# excited_dog = "excited dog" => local variable 
# @excited_dog = "excited dog" => instance variable
# @@excited_dog = "excited dog" => class variable

############################# Question 6 #############################

# class Television
#   def self.manufacturer
#     # method logic
#   end

#   def model
#     # method logic
#   end
# end

# The first method is the class method.

# call like this: Television.manufacturer

############################# Question 7 #############################

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

#@@cats_count is a class variable. It maintains its value across all instances of the class objects. And can
#have it's value altered by other instances of the class

# Test:

# p Cat.cats_count => 0

# cat = Cat.new('black')

# p Cat.cats_count => 1

############################# Question 8 #############################

# class Game
#   def play
#     "Start the game!"
#   end
# end

# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end
# end

############################# Question 9 #############################

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end


# creating a new play method in the Bingo class would overwritte the inherited play value in Game. 

############################# Question 10 #############################

# Easier to organize code (better manage complexity)
# Can make more robust applications because you can code more "world-like" examples
# Makes it easier to think about programs beyond loops and math. You can actually solve problems using some imagination
# Allows us to expose functionality in our code to other aspects that need it. 



