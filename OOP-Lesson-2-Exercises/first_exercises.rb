####### Question 1 ######

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# bob = Person.new('bob')
# p bob.name                  # => 'bob'
# bob.name = 'Robert'
# p bob.name                  # => 'Robert'

################ Question 2 ##################
class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name = '')
    @first_name = first_name
    @last_name = last_name
  end

  def name 
    puts "#{first_name} #{last_name}"
  end
end

# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'

########### Question 3 ##################

class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name = '')
    @first_name = first_name
    @last_name = last_name
  end

  def name 
    puts "#{first_name} #{last_name}"
  end

  def name=(fullname)
    names = fullname.split(' ')
    self.first_name = names[0]
    self.last_name = names[1]
  end
end

# bob = Person.new('Robert')

# p bob.name = "Thomas Williams"
# p bob.first_name
# p bob.last_name

########### Question 4 ##################

class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name = '')
    @first_name = first_name
    @last_name = last_name
  end

  def name 
    puts "#{first_name} #{last_name}"
  end

  def name=(fullname)
    names = fullname.split(' ')
    self.first_name = names[0]
    self.last_name = names[1]
  end
end

# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')

########### Question 5 ##################

class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name = '')
    @first_name = first_name
    @last_name = last_name
  end

  def name 
    puts "#{first_name} #{last_name}"
  end

  def name=(fullname)
    names = fullname.split(' ')
    self.first_name = names[0]
    self.last_name = names[1]
  end

  def to_s
    name
  end
end


# bob = Person.new("Thomas Williams")
# puts "the person's name is: #{bob}"


##################################### Inheritance #######################################

####### Question 1 ######

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming'
#   end
# end



# class Bulldog < Dog
#   def swim
#     "can't swim"
#   end
# end


# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim  

# todd = Bulldog.new  
# puts todd.speak           # => "bark!"
# puts todd.swim 



################### Question 2 #####################

class Pet
   def speak
    'bark!'
  end

   def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def swim
    'swimming'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim"
  end
end


pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

p pete.run                # => "running!"
p pete.speak              # => NoMethodError

p kitty.run               # => "running!"
p kitty.speak             # => "meow!"
p kitty.fetch             # => NoMethodError

p dave.speak              # => "bark!"

p bud.run                 # => "running!"
p bud.swim                # => "can't swim!"





################### Question 3 #####################

On paper




################### Question 4 #####################

# Method lookup path uses .ancestor to look at the class hierarchy path that reveals all classes that were leveraged in order
# to bring forth the result from the object in question. It is important because understanding from which objects
# classes are derived can help us to determine what other methods are compatible with those objects.

# For example, knowing that arrays and hashes are both derived from the Enumarator class, allow me to know that
# I can share methods between them such as, select and map. 











