bye_counter = 0

puts "Speak to granny!"
while true
  speak_to_granny = gets.chomp

  if speak_to_granny == "BYE"
    bye_counter += 1
    if bye_counter == 3
      puts "Well, if you must go, so long Dearie!"	
      break
    end
	puts "Hmmm dee dee doo!"
  else
    bye_counter = 0
    if speak_to_granny != speak_to_granny.capitalize || speak_to_granny.length == 0
      puts "HUH?! SPEAK UP, SONNY!"
    else
      random_year = 1930 + rand(20)
      puts "NO, NOT SINCE " + random_year.to_s + "!"
    end
  end
end
