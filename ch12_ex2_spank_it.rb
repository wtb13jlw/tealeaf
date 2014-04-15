puts "What year were you born?  (4 digits Please)"
byr = gets.chomp.to_i

puts "What month were you born?"
bmon = gets.chomp.to_i

puts "What day were you born?"
bday = gets.chomp.to_i

cur_time = Time.now.strftime("%Y %m %d").split
cyr = cur_time[0].to_i
cmon = cur_time[1].to_i
cday = cur_time[2].to_i

age = cyr - byr
if cmon < bmon
  age -= 1
elsif cmon = bmon 
  if cday < bday
  	age -= 1
  end
end

puts "\nYou are #{age} years old!\n"

age.times do
  puts "Spank!"
end

