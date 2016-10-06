#################### Question 1 #########################

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Ben is right. He doesn't need the @ before balance because he already took care of the getter for the @balance local 
#variable above. The @ isn't neccessary.

#################### Question 2 #########################

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# This will fail because this code attempts to set the value of quantity to a new value, however, the instance
# variable only has read only permissions, not writting permissions. One way to address it would be to change
# the permissions on the variable to attr_accessor

#################### Question 3 #########################

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# One problem with fixing it this way is, if we give quantity written and read permissions to the quantity object,
# it would be possible to alter the value at will. Which could be an issue on a security perspective. 
# Using self will allow someone to alter the quantity of every new InvoiceEntry object at will. 
# Quantity can be changed outside of the update_quantity method

#################### Question 4 #########################


# class Greeting
#   def greet(string)
#     puts string
#   end
# end

# class Hello < Greeting
#   def hi
#      greet("Hello")
#   end
# end


# class Goodbye < Greeting
#   def bye
#      greet("Goodbye")
#   end
# end


# hello = Hello.new
# good = Goodbye.new

# hello.hi

# good.bye

#################### Question 5 #########################

# class KrispyKreme
#   attr_reader :filling_type, :glazing
#   def initialize(filling_type, glazing)
#     @filling_type = filling_type
#     @glazing = glazing
#   end

#   def to_s
#    return "Plain with #{glazing}" if glazing && filling_type == nil
      
#    return "#{filling_type}" if filling_type && glazing == nil
      
#    return "Plain" if glazing == nil && filling_type == nil
      
#    "#{self.filling_type} with #{self.glazing}" 
#   end
# end

# donut1 = KrispyKreme.new(nil, nil)
# donut2 = KrispyKreme.new("Vanilla", nil)
# donut3 = KrispyKreme.new(nil, "sugar")
# donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
# donut5 = KrispyKreme.new("Custard", "icing")

# puts donut1

# puts donut2

# puts donut3

# puts donut4

# puts donut5

#################### Question 6 #########################

# class Computer
#   attr_accessor :template

#   def create_template
#     @template = "template 14231"
#   end

#   def show_template
#     template
#   end
# end

# #and

# class Computer
#   attr_accessor :template

#   def create_template
#     self.template = "template 14231"
#   end

#   def show_template
#     self.template
#   end
# end

# Both are okay. The use of self in teh getter method in the second example is unneccessary due to the attribute
# accessor. (So it can just be left as "template")

#################### Question 7 #########################



class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.info #or information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end
end









































