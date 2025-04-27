class Vehicle

  attr_accessor :year

  @@amount_of_vehicles = 0

  def initialize(year)
    @@amount_of_vehicles += 1
    @year = year
  end

  def self.total_of_vehicles
    @@amount_of_vehicles
  end

  def age
    calculate_age
  end

  def calculate_age
    factory_year = Time.new @year
    Time.now.year - factory_year.year
  end

end


class MyCar < Vehicle

  def which
    "My Car"
  end
  
end

module Odometro

  def initialize(year)
    @distance = 0
    super(year)
  end

  def increase_distance amount
    @distance += amount
  end
end

class MyTruck < Vehicle
  
  include Odometro

  def which
    "My Truck"
  end

  def fiscalizar
    "#{@distance} Km/h"
  end

end

carro = MyCar.new(2010)
caminhao = MyTruck.new(2020)

p Vehicle.total_of_vehicles

caminhao.increase_distance 10

p caminhao.fiscalizar

p carro.which
p carro.age
p caminhao.which
p caminhao.age


class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new "Joe", 90
bob = Student.new "Bob", 84

puts "Well done!" if joe.better_grade_than?(bob)
