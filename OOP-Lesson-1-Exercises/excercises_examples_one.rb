# Create a class like this
class GoodDog
end

# Instantiate an object like this
sparky = GoodDog.new


#Modules

module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
  include Dance
end

sparky = GoodDog.new
sparky.speak("Arf!")

bob = HumanBeing.new
bob.speak("Hello!")

puts "---GoodDog Ancestors"
puts GoodDog.ancestors
puts ''
puts "---HumanBeing Ancestors"
puts HumanBeing.ancestors


#Question 1 

#First we create our class using a similar format to creating a method 
class MyClass
end
#We create an object in Ruby by setting a variable equal to a new instance of a class object using ".new"
new_class = MyClass.new


# Question 2

# A module is a "collection of behaviors" that can be "mixed in" with other classes. 

# We use them in classes by using the "Include" reserved word. 

# Example

  # module Dance
  #   def dance(style)
  #     puts "#{style}"
  #   end
  # end

  # class HumanBeing
  #   include Speak
  #   include Dance
  # end
