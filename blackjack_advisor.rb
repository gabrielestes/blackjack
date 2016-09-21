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
      puts 'Please enter a valid deck number. '
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
      @deck.hard_hand
  end

  def get_cards
    ask_first_card
    verify_card
    @first_card = @card
    ask_second_card
    verify_card
    @second_card = @card
    ask_dealer_card
    verify_card
    @dealer_card = @card
  end

  def verify_card
    @card = gets.chomp.downcase
    if @card == 'j' || @card == 'q' || @card == 'k'
      @card = 10
    elsif @card == 'a'
    elsif @card.to_i >= 2 || @card.to_i <= 10
      @card = @card.to_i
    else
      "Not a valid card."
      get_cards
    end
  end

  def ask_first_card
    puts "What is the first card in your hand?"
  end

  def ask_second_card
    puts "What is the second card in your hand?"
  end

  def ask_dealer_card
    puts "What is the dealer's card?"
  end
end

def main

  game = BlackJack.new #creates new instance of this class.

  game.start #execute start method. Sets @deck the return of get_deck_number

  game.open_deck #sets deck to new instance of DeckNumber

  game.ask_first_card
  game.verify_card

  game.ask_second_card
  game.verify_card

  game.ask_dealer_card
  game.verify_card

  game.advice

end

main if __FILE__ == $PROGRAM_NAME
