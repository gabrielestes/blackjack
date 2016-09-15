require 'pry'
game_hash = {}
game_hash['player'] = []
game_hash['dealer'] = []

deck = {}
suits = ['clubs', 'spades', 'hearts', 'diamonds']
suits.each do |s|
  deck[s] = [*2..10, "J", "Q", "K"]
end


def player_card(card, game_hash)
  if card == "J" || card == "Q" || card == "K"
    game_hash['player'] << 10
  elsif card.to_i >= 2 && card.to_i <= 10
    game_hash['player'] << card.to_i
  elsif card == "A" && game_hash['player'].include?("A")
    puts "Split."
  elsif card == "A"
    game_hash['player'] << 11
  end
end

def dealer_card(card)
  if card == "J" || card == "Q" || card == "K"
    game_hash['dealer'] << 10
  elsif card >= 2 || card <= 10
    game_hash['dealer'] << card.to_i
  elsif card == "A"
    game_hash['dealer'] << 11
  end
end

def advice(game_hash)
  sum = 0
  game_hash['player'].each { |card| sum += card}
  if sum == 21
    puts "You win!"
  elsif sum < 17 && sum > 0
    puts "Your total is #{sum}. You should hit."
  elsif sum >= 17 && sum < 21
    puts "You should stand."
  else
    puts "You should surrender."
  end
    print sum
end

puts "What card is in your hand? (\"K\" = King, \"Q\" = Queen, \"J\" = Jack, \"A\" = Ace)"
  card = gets.chomp
  player_card(card, game_hash)

puts "What is your second card?"
  card = gets.chomp
  player_card(card, game_hash)
  advice(game_hash)
