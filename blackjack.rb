#Normal requirements

#the output of the program:
#offer the next optimal move for the user based on:
#user's two cards
#dealer's one card

#Reference the online data
#use default 1 deck

#Must use hashes or arrays within a hash

#user must be able to enter J, Q, K, or A as valid values.

#Step One:

##Prompt user for first input
  #Run a method to check validity of answer, ask again if not
  #If valid answer, store in array (translate into 10's or 11's)
##Prompt user for second input
  #Run a method to check validity of answer, ask again if not
  #If valid answer, store in array

#Step two
##Prompt user for dealer's card
  #Run a method to check validity of answer, ask again if not
  #If valid answer, store as variable

#Step three
##Run method to access the data based on if hand is hard, soft, or a pair

#Step four
##Return the user's optimal move

#first number in hash is player total

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

def player_sum(player_cards, sum)
end

def main()

  player_cards = []
  dealer_card_arr = []

  puts "Enter your first card: (\"K\", \"Q\", and \"J\" for royals, \"A\" for ace.)"
  player_valid?(gets.chomp, player_cards)
  first_card = player_cards[0]

  puts "Enter your second card: (\"K\", \"Q\", and \"J\" for royals, \"A\" for ace.)"
  player_valid?(gets.chomp, player_cards)
  second_card = player_cards[1]
  puts "Player array is #{player_cards}. First card is #{first_card}. Second card is #{second_card}."

  puts "Enter the dealer's card: (\"K\", \"Q\", and \"J\" for royals, \"A\" for ace.)"
  dealer_valid?(gets.chomp, dealer_card_arr)
  dealer_card = dealer_card_arr[0]
  puts "Dealer card is #{dealer_card}."
  sum = 0
  player_cards.each { |card| sum += card }
  puts "Sum of player cards is #{sum}."
end

main
