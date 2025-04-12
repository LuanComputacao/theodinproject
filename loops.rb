

puts "While"
i = 0
loop do
  puts "i is #{i}"
  i += 1
  break if i == 10
end


puts "While"
i = 0
while i < 10 do
  puts "i is #{i}"
  i += 1
end


puts "Until"
i = 0
until i >= 10 do
  puts "i is #{i}"
  i += 1
end

puts "Pizza"
until gets.chomp == "yes" do
  puts "Do you like Pizza?"
end


puts "For"

for i in 0..5
  puts "#{i} zombies incoming!"
end

puts "Times"
5.times do |time|
  puts "#{time} Time"
end


