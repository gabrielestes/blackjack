
game_hash = {}
game_hash['player'] = []
game_hash['dealer'] = []

hit_hash = {
  hard_hit_hash = {
    [*2..11] => [*5..11],
    [2, 3] => [12],
    [*7..11] => [12..16]}
    => "Hard Hit"

  soft_hit_hash = {
    [*2..11] => [*13..17],
    [*3..6] => [18],
    [6] => [19],
    [9, 10] => [18]}
    => "Soft Hit"
}
pair_hash = {
  pair_hit_hash = {
    [*8..11] => "Twos"
    [*9..11] => "Threes"
    [2, 3, 7, 8, 9, 10, 11] => "Fours"
    [*2..11] => "Fives"
    [*8..11] => "Sixes"
    [9, 11] => "Sevens"}
    => "Pair Hit"

  pair_split_hash = {
    [*2..7] => "Twos"
    [*2..8] => "Threes"
    [4, 5, 6] => "Fours"
    [*2..7] => "Sixes"
    [*2..8] => "Sevens"
    [*2..11] => "Eights"
    [2, 3, 4, 5, 6, 8, 9] => "Nines"
    [*2..11] => "Aces"}
    => ""
}

def player_card(card, game_hash)
  if card == "J" || card == "Q" || card == "K"
    game_hash['player'] << 10
  elsif card.to_i >= 2 && card.to_i <= 10
    game_hash['player'] << card.to_i
  elsif card == "A"
    game_hash['player'] << 11
  end
end

def dealer_card(card, game_hash)
  if card == "J" || card == "Q" || card == "K"
    game_hash['dealer'] << 10
  elsif card.to_i >= 2 && card.to_i <= 10
    game_hash['dealer'] << card.to_i
  elsif card == "A"
    game_hash['dealer'] << 11
    hard = true
  end
end

def player_sum(game_hash)
  total = 0
  print game_hash['player'].each { |x| x += total}
end

def hard_hit(dealer_card, hard_hit_hash, total)
  hard_hit_hash.each { |key| if hard_hit_hash.key.include?(dealer_card)
    puts "Hit."
    end }
end

def soft_hit(dealer_card, soft_hit_hash, total)
  soft_hit_hash.each { |key, value| if soft_hit_hash.key.include?(dealer_card) && soft_hit_hash.value.include?(total)
    puts "Hit."
    end }
end

# def pairs(pair_hash)
# end

puts "What card is in your hand? (\"K\" = King, \"Q\" = Queen, \"J\" = Jack, \"A\" = Ace)"
  card = gets.chomp
  first_card = card
  player_card(card, game_hash)

puts "What is your second card?"
  card = gets.chomp
  second_card = card
  player_card(card, game_hash)

puts "What is the dealer's card?"
  card = gets.chomp
  dealer_card(card, game_hash)
  total = player_sum(game_hash)
  puts "Player's cards: #{game_hash}"

if hard == true
  hard_hit(dealer_card(card, game_hash), hit_hash, total)
else
  soft_hit(dealer_card(car, game_hash), hit_hash, total)
end
