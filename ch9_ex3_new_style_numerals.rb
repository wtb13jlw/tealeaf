def translate(num)
  roman_numerals = ""
  
  roman_numerals += ("M" * (num / 1000)) 
  num = num % 1000
  
  #puts roman_numerals
  
  if num / 100 == 9
    roman_numerals += "CM"
	num -= 900
  else  
    roman_numerals += ("D" * (num / 500))
    num = num % 500
  end
  
  #puts roman_numerals
  if num /100 == 4
    roman_numerals += "CD"
	num -= 400
  else
    roman_numerals += ("C" * (num / 100)) 
    num = num % 100
  end
  
  #puts roman_numerals
  if num /10 == 9
    roman_numerals += "XC"
	num -= 90
  else
    roman_numerals += ("L" *( num / 50))
    num = num % 50
  end
  
  #puts roman_numerals
  if num /10 == 4
    roman_numerals += "XL"
	num -= 40
  else
    roman_numerals += ("X" * (num / 10))
    num = num % 10
  end
  
  #puts roman_numerals
  if num == 9
    roman_numerals += "IX"
	num -= 9
  else
    roman_numerals += ("V" * (num / 5))
    num = num % 5
  end
  
  #puts roman_numerals
  if num == 4
    roman_numerals += "IV"
  else
	roman_numerals += ("I" * (num / 1)) 
  end
  
  return roman_numerals
end

puts "Enter a number (less than 4000) to convert to New Style Roman Numerals:"
input_num = gets.chomp.to_i
if input_num > 0  && input_num < 4000 
  roman_numerals = translate(input_num)
  puts "The number " + input_num.to_s + " is " + roman_numerals + " in numerals"
elsif input_num > 3999
  puts "Please enter a number less than 4000!"
else
  puts "You entered zero, nothing, or a non-numeric value."
end