def translate(num)
  old_style_numerals = ""
  
  old_style_numerals += ("M" * (num /1000)) 
  num = num % 1000

  old_style_numerals += ("D" * (num / 500))
  num = num % 500
  
  old_style_numerals += ("C" * (num / 100)) 
  num = num % 100
  
  old_style_numerals += ("L" *( num / 50))
  num = num % 50

  old_style_numerals += ("X" * (num / 10))
  num = num % 10

  old_style_numerals += ("V" * (num / 5))
  num = num % 5
  
  old_style_numerals += ("I" * (num / 1)) 
  return old_style_numerals
end

puts "Enter a number to convert to Old Style Roman Numerals:"
input_num = gets.chomp.to_i
if input_num > 0
  output_numerals = translate(input_num)
  puts "The number " + input_num.to_s + " is " + output_numerals + " in numerals"
else
  puts "You entered zero, nothing, or a non-numeric value."
end