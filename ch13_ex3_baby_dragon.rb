# Baby Dragon

class Dragon

  def initialize name
    @name = name
    @asleep = false
    @stuff_in_belly = 10 # He's full.
    @stuff_in_intestine = 0 # He doesn't need to go.
    puts "#{@name} is born."
  end

  def feed
    puts "You feed #{@name}."
    @stuff_in_belly = 10
    passage_of_time
  end

  def walk
    puts "You walk #{@name}."
    @stuff_in_intestine = 0
    passage_of_time
  end
 
  def put_to_bed
    puts "You put #{@name} to bed."
    @asleep = true
    3.times do
      if @asleep
        passage_of_time
      end
      if @asleep
        puts "#{@name} snores, filling the room with smoke."
        end
    end
  
    if @asleep
      @asleep = false
      puts "#{@name} wakes up slowly."
    end
  end

  def toss
    puts "You toss #{@name} up into the air."
    puts 'He giggles, which singes your eyebrows.'
    passage_of_time
  end

  def rock
    puts "You rock #{@name} gently."
    @asleep = true
    puts 'He briefly dozes off...'
    passage_of_time
    if @asleep
      @asleep = false
      puts '...but wakes when you stop.'
    end
  end

  private
  # "private" means that the methods defined here are
  # methods internal to the object. (You can feed your
  # dragon, but you can't ask him whether he's hungry.)
  
  def hungry?
    # Method names can end with "?".
    # Usually, we do this only if the method
    # returns true or false, like this:
    @stuff_in_belly <= 2
  end

  def poopy?
    @stuff_in_intestine >= 8
   end

  def passage_of_time
    if @stuff_in_belly > 0
      # Move food from belly to intestine.
      @stuff_in_belly = @stuff_in_belly - 1
      @stuff_in_intestine = @stuff_in_intestine + 1
    else # Our dragon is starving!
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts "#{@name} is starving! In desperation, he ate YOU!"
      exit
    end
  
    if @stuff_in_intestine >= 10
      @stuff_in_intestine = 0
      puts "Whoops! #{@name} had an accident..."
    end
  
    if hungry?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts "#{@name}'s stomach grumbles..."
    end
  
    if poopy?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts "#{@name} does the potty dance..."
    end
  end
end

# Main code begins here

puts "Welcome!  What would you is the name of your baby Dino?"
dragon_name = gets.chomp
dragon_name = "Puff" if dragon_name.length == 0 
baby = Dragon.new(dragon_name)

puts "OK, Your Dragon's name is #{dragon_name}"
puts "What whould you like to do with #{dragon_name}?"
puts "1) Feed   2) Toss in air   3) Rock to sleep   4) Put to bed   5) Walk   9) exit"

loop do
  command = gets.chomp.to_i
  case command
  when 1
    baby.feed
  when 2 
    baby.toss
  when 3
    baby.rock
  when 4
    baby.put_to_bed
  when 5
    baby.walk
  when 9
    puts "Good bye!"
    exit(0)
  else
    puts "Please enter a valid choice"
    puts "1) Feed   2) Toss in air   3) Rock to sleep   4) Put to bed   5) Walk   9) exit"
  end
end
