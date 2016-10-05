# class Person
#   attr_accessor :name

#   def ==(other)
#     name == other.name     # relying on String#== here
#   end
# end

# bob = Person.new
# bob.name = "bob"

# bob2 = Person.new
# bob2.name = "bob"

# bob == bob2                # => true

# bob_copy = bob
# bob == bob_copy            # => true

str1 = "something"
str2 = "something"
 
p str1.object_id            # => 70186013144280
p str2.object_id    

arr1 = [1,2,3]
arr2 = [1,2,3]

arr1.object_id == arr2.object_id

sym1 = :something 
sym2 = :something

sym.object_id == sym2.object_id

int1 = 5
int2 = 5
int1.object_id == int2.object_id