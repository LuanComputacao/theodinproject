# HashMap class
class HashMap
  def initialize(initial_capacity = 16, load_factor = 0.75)
    @capacity = initial_capacity
    @load_factor = load_factor
    @size = 0
    @buckets = Array.new(@capacity) { [] }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code
  end

  def set(key, value)
    grow_if_needed
    index = index_for(key)
    raise IndexError if index.negative? || index >= @buckets.length

    bucket = @buckets[index]
    pair = bucket.find { |k, _| k == key }

    if pair
      pair[1] = value
    else
      bucket << [key, value]
      @size += 1
    end
  end

  def get(key)
    index = index_for(key)
    raise IndexError if index.negative? || index >= @buckets.length

    bucket = @buckets[index]
    pair = bucket.find { |k, _| k == key }
    pair ? pair[1] : nil
  end

  def has?(key)
    index = index_for(key)
    raise IndexError if index.negative? || index >= @buckets.length

    bucket = @buckets[index]
    bucket.any? { |k, _| k == key }
  end

  def remove(key)
    index = index_for(key)
    raise IndexError if index.negative? || index >= @buckets.length

    bucket = @buckets[index]
    pair_index = bucket.index { |k, _| k == key }

    return unless pair_index

    removed = bucket.delete_at(pair_index)
    @size -= 1
    removed[1]
  end

  def length
    @size
  end

  def clear
    @buckets = Array.new(@capacity) { [] }
    @size = 0
  end

  def keys
    @buckets.flatten(1).map { |pair| pair[0] }
  end

  def values
    @buckets.flatten(1).map { |pair| pair[1] }
  end

  def entries
    @buckets.flatten(1)
  end

  private

  def index_for(key)
    hash(key).abs % @buckets.length
  end

  def grow_if_needed
    return unless (@size.to_f / @capacity) >= @load_factor

    old_buckets = @buckets
    @capacity *= 2
    @buckets = Array.new(@capacity) { [] }
    @size = 0

    old_buckets.flatten(1).each do |key, value|
      set(key, value)
    end
  end
end

class HashSet
  def initialize(initial_capacity = 16, load_factor = 0.75)
    @map = HashMap.new(initial_capacity, load_factor)
  end

  def add(key)
    @map.set(key, true)
  end

  def remove(key)
    @map.remove(key)
  end

  def has?(key)
    @map.has?(key)
  end

  def clear
    @map.clear
  end

  def keys
    @map.keys
  end

  def length
    @map.length
  end
end

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

puts test.length # => 12

# Overwrite some values
test.set('apple', 'green')
test.set('banana', 'brown')

puts test.length # => still 12

# Trigger growth
test.set('moon', 'silver')

puts test.length # => 13
puts test.get('moon') # => "silver"

# Test other methods
puts test.has?('dog') # => true
puts test.remove('dog') # => "brown"
puts test.has?('dog') # => false

puts test.keys.inspect
puts test.values.inspect
puts test.entries.inspect

test.clear
puts test.length # => 0
