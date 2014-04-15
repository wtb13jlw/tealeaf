# One Billion Seconds!

bday = Time.local(1960, 01, 01, 00, 01)  

puts "If I was born on #{bday}"

turn_1billion = bday + 1000000000

if turn_1billion > Time.now
	puts "I would turn 1 Billion seconds on #{turn_1billion}"
else
	puts "I turned 1 Billion seconds on #{turn_1billion}"
end
