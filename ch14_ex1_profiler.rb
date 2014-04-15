TEST_ON = true
def profile block_description, &block
	# My version tried the 'return unless' first.
  # This worked, but did not call the blocks.
  # So, I tried the author's version of if/else.
  # Mainly, I was confused as to the intended output.
  # In other words, I did not read fully understand the 
  # purpose of the exercise until I saw the final results. Duh!
  #
  #return unless TEST_ON
  if TEST_ON  
    start_time = Time.new
    block.call
    duration = Time.new - start_time
    puts "#{block_description}: #{duration} seconds"
  else
  	block.call
  end
end

profile '25000 doublings' do
  number = 1
  25000.times do
   number = number + number
  end

  puts "#{number.to_s.length} digits"
  # That's the number of digits in this HUGE number.
end

profile 'count to a million' do
  number = 0
  1000000.times do
    number = number + 1
  end
end

puts "The end."
