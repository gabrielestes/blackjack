j, q, k = 10, 10, 10
cards = []

puts "What card is in your hand?"
  cards << gets.chomp.to_i

loop do
  puts "Do you have another card in your hand? (Enter \"y\" or \"n\")"
  answer = gets.chomp
  if answer == "y"
    puts "What is your other card?"
    cards << gets.chomp.to_i
  elsif answer == "n"
    break
  end

end

sum = 0
cards.each { |card| sum += card }
print cards

#advise the optimal move for the user (hit or stand)
#Optimal: Hit until cards total >= 17 && total
if sum == 21
  puts "You win!"
elsif sum < 17 && sum > 0
  puts "Your total is #{sum}. You should hit."
elsif sum >= 17 && sum < 21
  puts "You should stand."
else
  "Unfortunately, you've exceeded 21 and lose.."
end
