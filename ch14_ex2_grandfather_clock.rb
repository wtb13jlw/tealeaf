def sound &block
  hour = Time.new.hour
  hour -= 12 if hour > 12

  hour.times do 
    block.call
  end
end

sound do
	puts "Dong!"
end

sound do
	puts "Cock-a-doodle doo!"
end

counter = 0
sound do
	counter += 1
	puts "Coo-coo! " * counter
end

crazy_things = ["What heck?!",
                "It's either that or something else.",
                ]
counter = 0
sound do
	counter += 1
	puts crazy_things[counter % 2]
end