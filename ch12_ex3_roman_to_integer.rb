def translate(num)
	val = 0
	prev = num[0]
	roman = { "M" => 1000,
		        "D" => 500,
		        "C" => 100,
		        "L" => 50,
		        "X" => 10,
	          "V" => 5,
	          "I" => 1
	        }

  num.each_char do |char|
  	if roman.include? char
      val -= (roman[prev] * 2) if roman[char] > roman[prev] 
      val += roman[char]
      prev = char
    else
    	puts "Please enter a valid Roman Numeral"
    	exit(1)
    end
  end
  return val
end

# Main code starts here

puts "Enter a Roman numeral to convert to an Integer:"
input_numeral = gets.chomp.upcase
int_num = translate(input_numeral)
puts "The Roman numeral #{input_numeral} is #{int_num} in Integer"
