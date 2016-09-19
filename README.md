#Blackjack
===
##Synopsis

#####The goal of this blackjack program is to provide statistically favorable advice to a user playing blackjack. Advice is determined by requesting the following information from the user:
#####  1. The two cards possessed by the user. (1-10, J, Q, K, A)
#####  2. The single card possessed by the dealer. (1-10, J, Q, K, A)

###Output
#####The user receives advice to *"hit"*, *"stand"*, *"double down"*, *"stand unless you can double down"*, or *"split"*.

##Code

######The following code determines the user's type of hand (*pair*, *soft*, or *hard*, respectively). The type of hand is incredibly important in determining which method to pass the card values through.
```Ruby
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
```

###Resources
#####Data used to determine the user's optimal move was gathered from the following site:
#####[Blackjack Data](http://wizardofodds.com/games/blackjack/strategy/calculator/)

###Language
#####Written in Ruby

###Author
#####Gabriel Estes

###Sidenote
#####Do not open this program in a casino.
