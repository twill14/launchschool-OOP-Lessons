# class GoodDog
#   def initialize
#     puts "This object was initialized!"
#   end
# end

# sparky = GoodDog.new

# class GoodDog
#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end

#   def name=(n)
#     @name = n
#   end

#   def speak 
#     "#{@name} says Arf!"
#   end
# end

# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
#   end

#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def speak 
#     "#{name} says arf!"
#   end

#   def info
#     "#{name} weighs #{self.weight} and is #{self.height} tall"
#   end
# end

# sparky = GoodDog.new("Sparky")

# fido = GoodDog.new("Fido")

# puts sparky.speak
# puts sparky.name
# sparky.name = "Spartacus"
# puts sparky.name
# puts sparky.speak

# sparky = GoodDog.new("Sparky", "12 inches", "30 pounds") 
# puts sparky.info

# sparky.change_info("Spartacus", "45 inches", "100 pounds")
# puts sparky.info

######################## Question 1 

# class MyCar
#   attr_accessor :color

#   def initialize(y, c, m)
#     @year = y
#     @color = c
#     @model = m
#     @current_speed = 0
#   end

#   def color=(c)
#     @color = c
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
# end


# buggy = MyCar.new(2016, 'blue', 'mercedes')

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


######################## Question 2 + 3

# class MyCar 
#   attr_accessor :color
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
# end


# buggy = MyCar.new(2016, 'blue', 'mercedes')


# puts buggy.color

# buggy.color = "green"

# puts buggy.color

# puts buggy.year

# buggy.spray_paint('orange')

# puts buggy.color
















































