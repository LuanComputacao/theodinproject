# frozen_string_literal: true

# This module works as a mixin
module Speak
  attr_accessor :name

  def initialize(name)
    puts 'A speaker was initialized!'
    # instance variable
    @name = name
  end

  def speak(sound)
    # Acces name using the instance variable
    puts "#{@name} -> #{sound}"
  end

  def say_name
    # Acces name using the getter method
    puts "My name is #{name}"
  end
end

# GoodDog class
class GoodDog
  include Speak
  DOG_YEARS = 7

  @@number_of_dogs = 0

  def initialize(name)
    @@number_of_dogs +=1
    super(name)
  end

  def self.what_am_i
    "I'm a GoodDog class"
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new('Sparky')
bob = HumanBeing.new('Bob')

puts sparky.name
puts sparky.speak('Arfi')
puts bob.name
puts bob.speak('Hello')

puts '---GoodDog ancestor---'
puts GoodDog.ancestors
puts ''

puts '---GoodDog ancestor---'
puts HumanBeing.ancestors
puts ''

# OOP II

luna = GoodDog.new('Luna')

puts GoodDog.what_am_i
puts GoodDog.total_number_of_dogs


puts luna
