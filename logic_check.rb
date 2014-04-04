def is_leap_year(year)
  if year % 4 == 0
    puts "is divisible by 4"
	answer = true
    if year % 100 == 0 && year % 400 == 0
	  puts "is divisible by 100 and 400"
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

if is_leap_year(2000)
  puts "starting year is a leap year"
else
  puts "starting year is not a leap year"
end