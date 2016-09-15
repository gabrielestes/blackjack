deck = {}
suits = ['clubs', 'spades', 'hearts', 'diamonds']
suits.each do |s|
  deck[s] = [*2..10, "J", "Q", "K"]
end

print deck
