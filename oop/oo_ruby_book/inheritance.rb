# frozen_string_literal: true

# Animal class
class Animal
  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def speak
    'Hello!'
  end
end

# Good Dog class
class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end

  def speak
    "#{super} From the Good Dog #{name}. Arf!"
  end
end

# Bad Dog class
class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

class Cat < Animal
end

sparky = GoodDog.new('Sparky')
paws = Cat.new('Paws')
bad = BadDog.new(2, 'bear')

puts bad
puts sparky.speak
puts paws.speak
