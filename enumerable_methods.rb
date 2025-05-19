class Foo
  include Enumerable

  def each
    yield 1
    yield 1, 2
    yield
  end

end


Foo.new.each_entry{ |element| p element }


class Array
  def my_each
    each do |e|
      yield(e)
    end
  end

  def my_all

    true unless block_given?
    each do |e|
      return false unless yield(e)
    end
    true
  end
end


[0,1,2,3].my_each { |x| puts "foi #{x}"}

puts [0,1,2,3].my_all { |e| e < 1 }
puts [0,1,2,3].my_all { |e| e > -1 }
