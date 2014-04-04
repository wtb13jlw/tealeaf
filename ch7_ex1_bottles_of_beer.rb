bottles = 99

while true
  if bottles > 1
    puts bottles.to_s + " Bottles of Beer on the Wall, " + bottles.to_s + " Bottles of Beer!"
  else
    puts bottles.to_s + " Bottle of Beer on the Wall, " + bottles.to_s + " Bottle of Beer!"
  end
  
  bottles_left = bottles -1
  
  if bottles_left > 0
    puts "  Take one down, pass it around, " + bottles.to_s + " Bottle(s) of Beer on the Wall!"
  else
    puts "  Take the last one down, pass it around, no more Bottles of Beer on the Wall!"
	break
  end
  
  bottles -= 1
end

puts "\n  Now go pick up all those bottles and put them in the recycle bin!"
