welcome = "Welcome " + "to " + "Ruby"

puts welcome

welcome = "Welcome " + 2.to_s + " to " + 2.to_s + " Ruby"

puts welcome

welcome = "Welcome #{2} to #{2} Ruby"

puts welcome

puts welcome[0, 3]

puts welcome[0.. -8]

puts welcome[-3..-1]

puts welcome.capitalize

puts welcome.upcase

puts welcome.downcase

puts welcome.include?("Ruby")



