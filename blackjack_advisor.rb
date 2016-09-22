require_relative 'deck_one'
require_relative 'deck_two'
require_relative 'deck_three'

class BlackJack
  def initialize
    @deck = nil
  end

  def start
    @deck = get_deck_number
  end

  def get_deck_number
    puts "How many decks would you like to play with? (1, 2, or 4)"
    @deck = gets.chomp.to_i
    if @deck < 1 || @deck == 3
      puts 'Not a valid deck number. '
      get_deck_number
    end
    @deck
  end

  def open_deck
    if @deck == 1
      @deck = DeckOne.new
    elsif @deck == 2
      @deck = DeckTwo.new
    elsif @deck >= 4
      @deck = DeckThree.new
    end
      @deck
  end

  def get_cards
    ask_first_card
    give_card_value
    @first_card = @card
    ask_second_card
    give_card_value
    @second_card = @card
    ask_dealer_card
    give_card_value
    @dealer_card = @card
  end

  def give_card_value
    @card = gets.chomp.downcase
    if @card == 'j' || @card == 'q' || @card == 'k'
      @card = 10
    elsif @card == 'a'
      @card = 11
    elsif @card.to_i >= 2 && @card.to_i <= 10
      @card = @card.to_i
    else
      puts "That is not a valid card. What is the card?"
      give_card_value
    end
  end

  def ask_first_card
    puts "What is the first card in your hand? (J, Q, K, for royals, A for ace.)"
  end

  def ask_second_card
    puts "What is the second card in your hand?"
  end

  def ask_dealer_card
    puts "What is the dealer's card?"
  end

  def determine_hand_type
    if @first_card == @second_card
      @hand_type = @deck.pair_hand
      puts 'You have a pair.'
    elsif @first_card == 11 || @second_card == 11
      @hand_type = @deck.soft_hand
      puts 'You have a soft hand.'
    else
      @hand_type = @deck.hard_hand
      puts 'You have a hard hand.'
    end
  end

  def add_player_cards
    @player_hand_sum = @first_card + @second_card
  end

  def give_advice
    if @player_hand_sum == 21
      puts 'You win!'
    else
      @hand_type.each do |hashes|
        hashes.each do |advice, cards|
          cards.each do |player, dealer|
            if player == @player_hand_sum && dealer.include?(@dealer_card)
              puts "You should #{advice}"

            end
          end
        end
      end
    end
  end
end

def main
  @valid_cards = [*1..10, "a", "j", "q", "k"]
  game = BlackJack.new

  game.start

  game.open_deck

  game.get_cards

  game.add_player_cards

  game.determine_hand_type

  game.give_advice
end

main if __FILE__ == $PROGRAM_NAME
