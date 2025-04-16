# frozen_string_literal: true

def bubble_sort(numbers)
  len = numbers.size
  (0..len).each do
    (0..len - 2).each do |j|
      next unless numbers[j] > numbers[j + 1]

      tmp = numbers[j]
      numbers[j] = numbers[j + 1]
      numbers[j + 1] = tmp
    end
  end
  numbers
end
