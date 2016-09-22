#Blackjack
===
##Synopsis

#####The goal of this blackjack program is to provide statistically favorable advice to a user playing blackjack. Advice is determined by requesting the following information from the user:
#####  1. How many decks are on the table.
#####  2.The two cards possessed by the user. (1-10, J, Q, K, A)
#####  3. The single card possessed by the dealer. (1-10, J, Q, K, A)

###Output
#####The user receives advice to *"hit"*, *"stand"*, *"double down"*, *"stand unless you can double down"*, or *"split"*.

##Code

######This is a snippet of code determines the user's type of hand (*pair*, *soft*, or *hard*, respectively). The type of hand is incredibly important in determining which method to pass the card values through. A similar statement exists for all hand types.
```Ruby
def determine_hand_type
  if @first_card == @second_card
    @hand_type = @deck.pair_hand
    ...
```

##Data
####The advanced version of this challenge is to incorporate multiple decks into the data structure. In order to maintain a readable and clean main page, I separated the deck options into three separate Ruby files. In those files, I created a class for each deck; DeckOne, DeckTwo, and DeckThree. DeckThree is for 4+ decks. When the user chooses a deck, a new object is created to represent a data structure that will be referenced as the program generates advice. Below is the method to create the new deck object.
```Ruby
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
```

##Resources
#####Data used to determine the user's optimal move was gathered from the following site:
#####[Blackjack Data](http://wizardofodds.com/games/blackjack/strategy/calculator/)

##Requirements
#####1. Up-to-date Ruby language
[Follow these instructions.](https://www.ruby-lang.org/en/downloads/)
#####2. Download the blackjack.rb file
[Click 'Clone or Download'](https://github.com/gabrielestes/blackjack)
#####3. Locate the file via the Terminal, and run the program:
```
$ruby blackjack.rb
```

##Language
#####Written in Ruby

##Author
#####Gabriel Estes

###Sidenote
#####Do not open this program in a casino.
