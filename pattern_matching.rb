# grade = gets.chomp
grade = 'C'

case grade
  when 'A' then puts 'Amazing effor'
  when 'B' then puts 'Good work'
  when 'C' then puts 'Well done'
  when 'D' then puts 'Room for improvement'
  else puts 'See me'
end

# Same as obove

case grade
in 'A' then puts 'Amazing effor'
in 'B' then puts 'Good work'
in 'C' then puts 'Well done'
in 'D' then puts 'Room for improvement'
else puts 'See me'
end

# Return values

result = case grade
in 'A' then 1
in 'B' then 2
in 'C' then 3
else 0
end

puts result

#  Variable pattern
puts  "Variable pattern"

a = 15
age = 15

puts a
case age
in ^a
  puts a
end

puts age
puts a

puts 'Splat operator (operador de coleta/expanção)'

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

case arr
in [Integer, Integer, *algo, 8, 10]
  puts "Começa com dois inteiros e termina com 8 e 10: #{algo}"
in [Integer, Integer, *algo, 9, 10]
  puts "Começa com dois inteiros e termina com 9 e 10 #{algo}"
end


puts "Find pattern"

data = [
  {name: 'James', age: 50, first_language: 'english', job_title: 'general manager'},
  {name: 'Jill', age: 32, first_language: 'italian', job_title: 'leet coder'},
  {name: 'Helen', age: 24, first_language: 'dutch', job_title: 'biscuit quality control'},
  {name: 'Bob', age: 64, first_language: 'english', job_title: 'table tennis king'},
  {name: 'Betty', age: 55, first_language: 'spanish', job_title: 'pie maker'},
]

name = 'Jill'
age = 32
job_title = 'leet coder'

match = data.find do |person|
  person[:name] == name && person[:age] == age && person[:job_title]
end

puts match


case data
in [*, {name: ^name, age: ^age, first_language: first_language, job_title: ^job_title}, *]
else
  first_language = nil
end

puts first_language
