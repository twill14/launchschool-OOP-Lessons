############################ Question 1 ##############################

# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# create new instance of Hello object. prints string "Hello" to screen
# will through an error as bye is not a reckognized method in Hello
# evaluates to nil, since nothing was passed into greet as a paramater
#prints goodbye to the screen. Evaluates greet based in greeting superclass, but passed message as the parameter

# hello = Hello.new
# p hello.hi

# hello = Hello.new
# p hello.bye

# p hello.greet

# hello = Hello.new
# p hello.greet("Goodbye")

# p Hello.hi

############################ Question 2 ##############################

# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def self.hi
#     greeting = Greeting.new
#     greeting.greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end


# p Hello.hi

############################ Question 3 ##############################

# class AngryCat
#   def initialize(age, name)
#     @age  = age
#     @name = name
#   end

#   def age
#     puts @age
#   end

#   def name
#     puts @name
#   end

#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# one_cat = AngryCat.new("10", "Charlie")
# two_cat = AngryCat.new("5", "Hebo")

############################ Question 4 ##############################

# class Cat
#   def initialize(type)
#     @type = type
#   end

#   def to_s
#     puts "I am a #{type} cat"
#   end
# end

############################ Question 5 ##############################

# class Television
#   def self.manufacturer
#     # method logic
#   end

#   def model
#     # method logic
#   end
# end

# tv = Television.new
# # p tv.manufacturer
# p tv.model

# p Television.manufacturer
# # p Television.model

############################ Question 6 ##############################

# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     @age += 1
#   end
# end

# cat = Cat.new("black", 10)

# cat.make_one_year_older

# p cat

############################ Question 7 ##############################

# class Light
#   attr_accessor :brightness, :color

#   def initialize(brightness, color)
#     @brightness = brightness
#     @color = color
#   end

#   def self.information
#     return "I want to turn on the light with a brightness level of super high and a color of green"
#   end

# end

#Return isn't needed. Also giving read and write access to brightness and color isn't neccssary.
#(unless we plan to add more instance methods to this class alter/ need to refer to the values of them in another class)






















