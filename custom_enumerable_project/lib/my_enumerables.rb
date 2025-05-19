module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    true unless block_given?
    each do |e|
      yield(e)
    end
  end

  def my_all?
    true unless block_given?
    each do |e|
      return false unless yield e
    end
    true
  end

  def my_none?
    false unless block_given?
    each do | e |
      return false if yield e
    end
    true
  end

  def my_any?
    true unless block_given?
    each do |e|
      return true if yield e
    end
    false
  end

  def my_count
    count = 0
    unless block_given?
      each do |e|
        count += 1
      end
      return count
    end

    each do |e|
      count += 1 if yield(e)
    end
    return count
  end

  def my_each_with_index
    each_with_index do |e, i|
      yield e, i
    end
  end

  # def reduce
  def my_inject start
    acc_set = !start.nil?
    acc = start
    each do |e|
      if acc_set
        acc = yield(acc, e)
      else
        acc = e
        acc_set = true
      end
    end
    acc
  end

  def my_map
    result = []
    each do | e |
      result << yield(e)
    end
    result
  end

  def my_select
    return enum_for(:my_select) unless block_given?

    result = []
    each do |e|
      result << e if yield(e)
    end
    result
  end
end
