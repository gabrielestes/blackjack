deck = {}
suits = ['clubs', 'spades', 'hearts', 'diamonds']
suits.each do |s|
  deck[s] = [*2..10, "J", "Q", "K"]
end

#compare dealer card with player sum
hard_hit = {
  *2..11 => *5..11,
  2, 3 => 12,
  *7..11 => 12..16}

hard_stand = {
  2, 3 => *13..21,
  *4..6 => *12..21,
  *7..11 => *17..21}


def hard_hit(player_sum, dealer_card, hard_hash)
  if hard_hash.find { |h| ['dealer_card'] == 'player_sum'}
    p true
  end
end
