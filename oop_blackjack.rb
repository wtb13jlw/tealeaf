class Card
	CARD_VALUE = {"2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8,
              "9"=>9, "10"=>10, "Jack"=>10, "Queen"=>10, "King"=>10, "Ace"=>11}

  attr_accessor :face, :suit, :value
  
  def initialize(face, suit)
    @face = face
    @suit = suit
    @value = set_value
  end
  
  def show
    "\t---> #{face} of #{suit}"
  end

  private

  def set_value
    @value = CARD_VALUE[@face]
  end
      
end


class Deck
  CARDS = %w[Ace 2 3 4 5 6 7 8 9 10 Jack Queen King]
  SUITS = %w[Clubs Hearts Spades Diamonds]

  attr_accessor :deck, :discard_deck

  def initialize(num_packs)
  	
   	@deck = []
    @discard_deck = []
    create(num_packs)
    
  end

  def create(num_packs)
  	pack = []
  	cards = CARDS.product(SUITS)
    cards.each do |c|
    	pack << Card.new(c[0], c[1])
    end
    
    @deck = pack * num_packs
    scramble
    @deck
  end
    
  def deal
    @discard_deck << @deck.pop
    card = @discard_deck.last
  end

  def reshuffle
    @deck += @discard_deck
  	@discard_deck.clear
  	scramble
  	@deck
  end
  
  def scramble
  	3.times do
      @deck.shuffle!
      # Now, cut the deck
      low_range = @deck.count * 0.33
      hi_range = @deck.count * 0.67
      random_cut = (low_range + (rand(hi_range - low_range))).to_i
      tmp_deck = @deck.drop(random_cut) + @deck.take(random_cut)
      @deck = tmp_deck
    end
 
    # Waste the first card
    waste = deal
    @deck
  
  end
  
  def count
    @deck.size
  end
  
  def discard_count
    @discard_deck.size
  end

end


class BlackJackHand

  attr_accessor :hand, :value, :aces, :name

  def initialize(name)
    @hand = []
    @value = 0
    @aces = 0
    @name = name

  end

  def take_card(deck)
  	card =  deck.deal
  	@value += card.value
  	@aces += 1 if card.face == "Ace"
    @hand << card
  end

  def reset
    @hand = []
    @value = 0
    @aces = 0
  end

  def bust
  	@value > 21 ? true : false
  end

  def show
  	#puts "\n#{@name} has a hand value of #{@value}"
    @hand.each do |card|
      puts card.show
    end
  end
end


class Player

	attr_accessor :name, :hand, :is_dealer

	def initialize(name, gametype, isdealer=false)
		@name = name
    @is_dealer = isdealer
    @gametype = gametype
    @hand = create_hand_type
 	end
  
  private

 	def create_hand_type
  
    if @gametype == "BlackJack"
    	blackjack_hand = BlackJackHand.new(@name)
    else
      # Only 1 game type for now
      blackjack_hand = BlackJackHand.new(@name)
    end
  end 

end


class Blackjack
  
  attr_accessor :blackjack_deck, :dealer, :player
	
  def establish_deck(number_of_packs)
    @blackjack_deck = Deck.new(number_of_packs)
    puts "Cards in deck - #{blackjack_deck.count}"

  end

  def initial_deal
  	blackjack_deck.reshuffle if blackjack_deck.count < 25
  	puts "@@@@@  --  Cards remaining in deck - #{blackjack_deck.count}  --  @@@@@"
    @player.hand.reset
    @dealer.hand.reset

    2.times do
    	@player.hand.take_card(blackjack_deck)
      @dealer.hand.take_card(blackjack_deck)
    end
  end

  def setup_players
    @dealer = Player.new("Fergus", "BlackJack", true)
    puts "Let's Play BlackJack!  I am your dealer and my name is #{@dealer.name}"
    puts "What shall I call you? "

    p_name = gets.chomp
    if p_name.length == 0
      puts "Hmmm, since you don't want to tell me your name, I'll call you Betty!"
      p_name = "Betty"
    end

    @player = Player.new(p_name, "BlackJack", false)
   
  end

  def player_turn(p)
  	loop do
      break if p.hand.value > 21  
      
      puts "Do you wish to Hit(H) or Stay(S)?  Default is Stay"
      play = gets.chomp.upcase
      break unless play == "H"
    
      p.hand.take_card(blackjack_deck)
      if p.hand.value > 21 && p.hand.aces > 0
      	p.hand.value -= 10
      	p.hand.aces -= 1
      end
      puts "\n#{p.name} now has a hand value of #{p.hand.value}"
      p.hand.show
            	
    end
  end

  def dealer_turn
    loop do
      break if @dealer.hand.value > 16  #  This is a soft hold
         
      puts "\n#{@dealer.name} takes another card"
      @dealer.hand.take_card(blackjack_deck)
      if @dealer.hand.value > 21 && @dealer.hand.aces > 0
      	@dealer.hand.value -= 10
      	@dealer.hand.aces -= 1
      end
      puts "\n#{@dealer.name} now has a hand value of #{@dealer.hand.value}"
      @dealer.hand.show
      	
    end
  end

  def determine_winner
  	case  # dealer.hand.value
      when @dealer.hand.value > @player.hand.value  
        "  $$$  House Wins!  $$$"

      when @dealer.hand.value < @player.hand.value
        "\n#{@player.name} Wins!"

      when @dealer.hand.value == @player.hand.value
        if @dealer_blackjack
          "#{@dealer.name} has BlackJack and beats your non-BlackJack 21.  $$$  House WINS!  $$$"
        else
          "The game is a DRAW!"
        end
    end
  end

  def run
    setup_players

    puts "Welcome #{@player.name}!  How many packs of cards would you like to use? (2-6)"
    num_packs = gets.chomp.to_i
    number_of_packs = num_packs.between?(2, 6) ? num_packs : 2
    puts "You chose to use #{number_of_packs} packs of cards for this deck"

    establish_deck(number_of_packs)
    
    loop do
      initial_deal
  
      puts "\nDealer #{@dealer.name}, has one card face up and one face down!"
      puts "\t---> Card Masked for Initial Deal"
      card2 = @dealer.hand.hand[1]
      puts card2.show
      
      puts "\n#{@player.name} has a hand value of #{@player.hand.value}"
      @player.hand.show

      @dealer_blackjack = true ? @dealer.hand.value == 21 : false
      if @dealer_blackjack && @player.hand.value == 21
      	puts "#{@dealer.name} and #{@player.name} both have BlackJack!  The game is a DRAW!"
      
      elsif  @player.hand.value == 21
      	puts "\n#{@player.name} has BlackJack!  #{@player.name} WINS!"
      	puts "The dealer's hand was -->"
      	@dealer.hand.show

      else
        puts "\n#{@player.name} goes first"
        player_turn(@player)

        if @player.hand.bust
        	puts "\n#{@player.name} has Busted!  $$$  House WINS!  $$$"
        	puts "The Dealer #{@dealer.name}, had this hand ---"
        	@dealer.hand.show
        else

          puts "\nPlaying Dealer hand"
          puts "\n#{@dealer.name} has a hand value of #{@dealer.hand.value}"
          @dealer.hand.show
  
          if @dealer_blackjack
            puts "Dealer #{@dealer.name}, has BlackJack!  $$$  House WINS!  $$$"
           
          else
            dealer_turn
            if @dealer.hand.bust
        	    puts "\n#{@dealer.name} has Busted!  #{@player.name} WINS!"
        	  else
        	  	puts "#{@dealer.name} stays with current hand"
              puts determine_winner
            end
          end
        end
      end

      puts "\nEnter 'Y' or press 'ENTER' to play again, enter 'N' to exit"
      play_again = gets.chomp.upcase
      break if play_again == "N"
      
    end
  end

end


# Main code starts here

game = Blackjack.new
game.run

at_exit { puts "\nThanks for playing today!  Please play again soon!" }