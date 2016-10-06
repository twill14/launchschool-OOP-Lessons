################ Question 1 ####################

# class SecretFile
#   def initialize(secret_data, log)
#     @data = secret_data
#     @login = log
#   end

#   def data
#     @log.create_log_entry
#     self.data
#   end
# end

# class SecurityLogger
#   def create_log_entry
#     puts "Hello"
#   end
# end


# secret = SecretFile.new("123", )

# secret.data

################ Question 2 AND 3 AND 4 ####################

module Fuelable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency
  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  
  include Fuelable
  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Seacraft
  attr_accessor :propeller_count, :hull_count
    include Fuelable
    def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
      @fuel_efficiency = km_traveled_per_liter
      @fuel_capacity = liters_of_fuel_capacity
      @propellers = num_propellers
      @hulls = num_hulls
  end

  def range
    range = super
    range + 10
  end
end

class Catamaran < Seacraft
end

class Motorboat < Seacraft
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super (1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

car = Auto.new
motor = Motorcycle.new
cat = Catamaran.new(3, 2, 80.4,20)

p car.range
p motor.range
p cat.range








