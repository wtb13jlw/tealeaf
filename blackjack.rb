CARD_VALUE = {"ace"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8,
              "9"=>9, "10"=>10, "Jack"=>10, "Queen"=>10, "King"=>10, "Ace"=>11}
CARDS = %w[Ace 2 3 4 5 6 7 8 9 10 Jack Queen King]
SUITS = %w[Clubs Hearts Spades Diamonds]

def deal_cards(deck)
  puts "Dealing initial hands"
  player_hand = []
  dealer_hand = []
  
  2.times do
    player_hand << deck.pop
    dealer_hand << deck.pop
  end
  
  return player_hand, dealer_hand

end

def calc_hand(hand)
  hand_value = 0
  hand.each { |card| hand_value += CARD_VALUE[card[0]] }
  
  return hand_value if hand_value < 22
  
  # combo represents the list of card/suit
  hand.each do |combo|
    if combo[0] == "Ace"
      combo[0] = "ace"
      hand_value -= 10
    end
  end
  
  hand_value

end

def display_hand(player, hand, hand_value, hide_card=false)

  puts "#{player} has a hand with a total value of #{hand_value}" unless hide_card
  puts "#{player}'s cards are:"
  
  hand.each { |card| puts "\t--> #{card[0]} of #{card[1]}" }
     
end

def player_turn(deck, hand, player, hand_value)
  
  puts "\nPlaying hand for #{player}" if hand_value == 0
  
  loop do
  	hand_value = calc_hand(hand)
    display_hand(player, hand, hand_value)  # false - player hands always up
    
    return hand, hand_value if hand_value > 21
    
  	puts "Do you wish to Hit(H) or Stay(S)?  Default is Stay"
  	play = gets.chomp.upcase
    return hand, hand_value unless play == "H"
    
    hand << deck.pop
    puts "\n"
  end

end

def dealer_turn(deck, hand, hand_value)
  puts "Playing Dealer hand" if hand_value == 0
  
  loop do
    hand_value = calc_hand(hand)
    display_hand("Dealer", hand, hand_value)  # false means no face down
    
    return hand, hand_value if hand_value > 21
    
    if hand_value == 21 && hand.size == 2
      puts "Dealer has BlackJack!"
      return hand, hand_value
    
    else
      if hand_value > 16  #  This is a soft hold
        puts "Dealer stays with current hand"
        return hand, hand_value
      end

      puts "\nDealer takes another card"
      hand << deck.pop
    end
  end

end

def determine_winner(dealer_hand_value, player_hand_value, player_name, dealer_blackjack)
  case  # dealer_hand_value
  when dealer_hand_value > 21
    puts "Dealer Busted!  #{player_name} Wins!"

  when dealer_hand_value < 22 && dealer_hand_value > player_hand_value  
    puts "House Wins!"

  when dealer_hand_value < 22 && dealer_hand_value < player_hand_value
    puts "\n#{player_name} Wins!"

  when dealer_hand_value == player_hand_value
    if dealer_blackjack
      puts "The dealer has BlackJack and beats your non-BlackJack 21"
    else
      puts "The game is a draw!"
    end
  
  end
  
end

def play_round(deck, discard_deck, player_name)
  if deck.size < 25
    puts "******************   Re-shuffling Deck!!   *****************"
    discard_deck.map! { |card| card == "ace" ? "Ace" : card }
    deck = deck + discard_deck
    deck.shuffle!
    discard_deck.clear
  end
    
  player_hand, dealer_hand = deal_cards(deck)
 
  dealer_blackjack = false
  dealer_hand_value = calc_hand(dealer_hand)
  dealer_blackjack = true ? dealer_hand_value == 21 : false
  
  player_hand_value = calc_hand(player_hand)
  if player_hand_value  == 21 # Must be BlackJack
    if dealer_blackjack 
      puts "The game is a draw!"
    else
      display_hand("Dealer", dealer_hand, dealer_hand_value)  
      display_hand(player_name, player_hand, player_hand_value)  
      puts "#{player_name} has BlackJack!  House does not, so #{player_name} wins!"
    end

  else
    puts "\n"
    tmp_hand = [["BACK", "CARD"], [dealer_hand[1][0], dealer_hand[1][1]]]
    display_hand("Dealer", tmp_hand, dealer_hand_value, true)  
    
    player_hand, player_hand_value = player_turn(deck, player_hand, player_name, 0)
    
    if player_hand_value > 21
      puts "#{player_name} has busted!  House Wins!"      
    
    else
      dealer_hand, dealer_hand_value = dealer_turn(deck, dealer_hand, 0)
      determine_winner(dealer_hand_value, player_hand_value, player_name, dealer_blackjack)
    end
  end
  
  discard_deck += (dealer_hand + player_hand) 
  return deck, discard_deck

end

# Main line code starts here!

discard_deck = []

puts "Let's Play BlackJack!  Please tell me your name? "
player_name = gets.chomp
if player_name.length == 0
  puts "Hmmm, since you don't want to tell me your name, I'll call you Betty!"
  player_name = "Betty"
end

puts "Welcome #{player_name}!  How many packs of cards would you like to use? (2-4)"
num_packs = gets.chomp.to_i
number_of_packs = 2
number_of_packs = num_packs if num_packs.between?(2, 4)

puts "\nMaking a deck with #{number_of_packs} of packs"
cards = CARDS.product(SUITS)
deck = cards * number_of_packs
deck.shuffle!

play_again = "Y"
loop do
  puts "\n"
    
  deck, discard_deck = play_round(deck, discard_deck, player_name)
 
  puts "\nEnter 'Y' or press 'ENTER' to play again, enter 'N' to exit"
  play_again = gets.chomp.upcase
  break if play_again == "N"
  play_again = "Y" 
  
end

at_exit { puts "\nThanks for playing today!  Please play again soon!" }