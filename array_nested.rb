test_scores = [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]

test_scores.each_with_index do |score|
  puts "score #{score}"
end



test_scores.each_with_index do |score|
  puts "score #{score}"
  score.each_entry { |i| p "#{i}" }
end

