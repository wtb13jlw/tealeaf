def is_leap_year(year)
  if year % 4 == 0
    answer = true
    if year % 100 == 0 && year % 400 == 0
	  return answer
	else
	  if year % 100 == 0 && year % 400 != 0
	    return false
	  else
	    return true
	  end
	end
  else
    return false
  end
end

puts "This program will tell you which years are leap years in a start-end range\n"
while true
  puts "Please enter a starting year:"
  start_year = gets.chomp.to_i
  if start_year > 0
    break
  else
    puts "\nYou entered a starting year that was either 0 or non-digit.  Please try again.\n"
  end
end

while true  
  puts "Please enter an ending year:"
  end_year = gets.chomp.to_i
  if end_year > start_year
    break
  else
    puts "\nYou entered an ending year that was either before or the same as the starting year,"
    puts "or is was non-digit."  
	puts "Please try again.\n"
  end
 end
	
puts "\nStart - " + start_year.to_s + " : End - " + end_year.to_s

range_of_years = end_year - start_year + 1
puts "range - " + range_of_years.to_s + " years"

year_to_check = start_year
increment_value = 1
while year_to_check <= end_year
  if is_leap_year(year_to_check)
    puts "Year " + year_to_check.to_s + " is a leap year"
	increment_value = 4
  end
  year_to_check += increment_value
end
