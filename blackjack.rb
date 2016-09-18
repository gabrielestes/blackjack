def player_valid?(card, player_cards)
  card = card.downcase
  pushed = false
  until pushed == true
    if card == "j" || card == "q" || card == "k"
      player_cards << 10
      pushed = true
    elsif card.to_i >= 2 && card.to_i <= 10
      player_cards << card.to_i
      pushed = true
    elsif card == "a" || card == "ace"
      player_cards << 11
      pushed = true
    else
      puts "Invalid card entry. Please enter a valid card: "
      card = gets.chomp.downcase
      pushed = false
    end
  end
  puts "The card you entered was #{card.upcase}."
end

def dealer_valid?(card, dealer_card_arr)
  card = card.downcase
  pushed = false
  until pushed == true
    if card == "j" || card == "q" || card == "k"
      dealer_card_arr << 10
      pushed = true
    elsif card.to_i >= 2 && card.to_i <= 10
      dealer_card_arr << card.to_i
      pushed = true
    elsif card == "a" || card == "ace"
      dealer_card_arr << 11
      pushed = true
    else
      puts "Invalid card entry. Please enter a valid card: "
      card = gets.chomp.downcase
      pushed = false
    end
  end
  puts "The dealer's card you entered was #{card.upcase}."
end

def hard_hand(hard_array, dealer_card, sum)
  hard_array.each do |hashes|
    hashes.each do |advice, cards|
      cards.each do |player, dealer|
        if player == sum && dealer.include?(dealer_card)
          puts "You should #{advice}"
        end
      end
    end
  end
end

def soft_hand(soft_array, dealer_card, sum)
  soft_array.each do |hashes|
    hashes.each do |advice, cards|
      cards.each do |player, dealer|
        if player == sum && dealer.include?(dealer_card)
          puts "You should #{advice}"
        end
      end
    end
  end
end

def pair_hand(player_cards, dealer_card, pair_array)
  pair_array.each do |hashes|
    hashes.each do |advice, cards|
      cards.each do |player, dealer|
        if player == player_cards[0] && dealer.include?(dealer_card)
        puts "You should #{advice}"
        end
      end
    end
  end
end

def main()

  hard_array = [
    {"hit." => {
      5 => [*2..11],
      6 => [*2..11],
      7 => [*2..11],
      8 => [*2..4, *7..11],
      9 => [*7..11],
      10 => [10, 11],
      12 => [2, 3, *7..11],
      13 => [*7..11],
      14 => [*7..11],
      15 => [*7..11],
      16 => [*7..11]
    }},
    {"double down." => {
      8 => [5, 6],
      9 => [*2..6],
      10 => [*2..9],
      11 => [*2..11]
    }},
    {"stand." => {
      12 => [4, 5, 6],
      13 => [*2..6],
      14 => [*2..6],
      15 => [*2..6],
      16 => [*2..6],
      17 => [*2..11],
      18 => [*2..11],
      19 => [*2..11],
      20 => [*2..11],
      21 => [*2..11]
    }}
  ]
  soft_array = [
    "hit." => {
      13 => [2,3, *7..11],
      14 => [2,3, *7..11],
      15 => [2,3, *7..11],
      16 => [2,3, *7..11],
      17 => [*7..11],
      18 => [9, 10]
    },
    "double down." => {
      13 => [4, 5, 6],
      14 => [4, 5, 6],
      15 => [4, 5, 6],
      16 => [4, 5, 6],
      17 => [*2..6]
    },
    "stand unless you can double down." => {
      18 => [*3..6],
      19 => [6]
    },
    "stand." => {
      18 => [2, 7, 8, 11],
      19 => [*2..5, *7..11],
      20 => [*2..11],
      21 => [*2..11]
    }
  ]
  pair_array = [
    {"hit." => {
      2 => [*8..11],
      3 => [9, 10, 11],
      4 => [2, 3, *7..11],
      5 => [10, 11],
      6 => [*8..11],
      7 => [9, 11]
    }},
    {"double down." => {
      5 => [*2..9]
    }},
    {"stand." => {
      7 => [10],
      9 => [7, 10, 11],
      10 => [*2..11]
    }},
    {"split." => {
      2 => [*2..7],
      3 => [*2..8],
      4 => [4, 5, 6],
      6 => [*2..7],
      7 => [*2..8],
      8 => [*2..11],
      9 => [*2..6, 8, 9],
      11 => [*2..11]
    }}
  ]
  player_cards = []
  dealer_card_arr = []

  puts "Enter your first card: (\"K\", \"Q\", and \"J\" for royals, \"A\" for ace.)"
  player_valid?(gets.chomp, player_cards)
  first_card = player_cards[0]

  puts "Enter your second card: (\"K\", \"Q\", and \"J\" for royals, \"A\" for ace.)"
  player_valid?(gets.chomp, player_cards)
  second_card = player_cards[1]

  puts "Enter the dealer's card: (\"K\", \"Q\", and \"J\" for royals, \"A\" for ace.)"
  dealer_valid?(gets.chomp, dealer_card_arr)
  dealer_card = dealer_card_arr[0]

  puts "Your cards are #{player_cards[0]} and #{player_cards[1]}."
  sum = 0
  player_cards.each { |card| sum += card }

  if first_card == second_card
    puts "You have a pair hand. "
    pair_hand(player_cards, dealer_card, pair_array)
  elsif player_cards.include?(11)
    puts "You have a soft hand. "
    soft_hand(soft_array, dealer_card, sum)
  else
    puts "You have a hard hand. "
    hard_hand(hard_array, dealer_card, sum)
  end
end

main
