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

class GoodDog
  include Speak
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
