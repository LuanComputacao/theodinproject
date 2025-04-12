hash1 = { "a" => 100, "b" => 200 }
hash2 = { "b" => 254, "c" => 300 }


puts hash2["b"]

puts "#{hash2.fetch("d", "-1")}"


puts hash1.merge(hash2)


# Rocket syntax

rocket = {
  :chevrolet => "Chevrolet",
  :ford => "Ford",
  :dodge => "Dodge",
}

puts rocket[:chevrolet]




