puts "Enter a string"

text = gets.chomp

if text.include?("s")
  text.gsub!(/s/, "th")
elsif text.include?("S")
  text.gsub!(/S/, "TH")
end

puts "Your string is #{text}"


puts "Attack by land(l) or sea(s)?"

attack_type = gets.chomp

if attack_type == "l"
  puts "====> Release the goat"
elsif attack_type == "s"
  puts "~~~~> Release the shark"
else
  puts "****> Release Kevin the octopus"
end


case attack_type
when 'l'
  puts "=> Goat"
when 's'
  puts "~> Shark"
else
  puts "*> Octopus"
end





