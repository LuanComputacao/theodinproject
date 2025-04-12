puts "Testando o return automático do Ruby"

def return_squared(number)
  number = 4
  number * number
end



def return_squared_sum(number)
  sum = number * number
  number + sum
end


the_number=3
p return_squared(the_number)
p the_number
p return_squared_sum(3)


