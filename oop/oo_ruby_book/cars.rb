# frozen_string_literal: true

# Engine class
class Engine
  def start
    puts 'Engine starting...'
  end

  def shut_off
    puts 'Engine shuting off...'
  end
end

# Car class
class Car
  attr_reader :speed

  def initialize
    @engine = Engine.new
    @speed = 0
  end

  def start
    @engine.start
    puts "#{speed} km/h"
  end

  def shut_off
    @speed = 0
    @engine.shut_off
  end

  def speed_up(km_by_h)
    @speed += km_by_h
    puts "#{speed} km/h"
  end

  def break
    speed = 0
    puts "#{speed} km/h"
  end
end

# My Car class
class MyCar < Car

  attr_reader :year, :color

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    super()
  end

  def spray_paint(color)
    @color = color
    puts "Your new color is #{color}"
  end

end

my_car = MyCar.new(2025, 'red', 'corsa')
my_car.start

my_car.speed_up(10)
my_car.break
my_car.shut_off
puts my_car.color
my_car.spray_paint('green')
puts my_car.color
puts my_car.year
