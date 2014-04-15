helper_name = "/Users/jeffreywade/tealeaf/birthdates.txt"

helper_file = File.new(helper_name, "r")
birth_dates = {}

if helper_file
	helper_file.each_line do |line|
		fields = line.strip.split(',')
		name = fields[0]
		month_day = fields[1]
		year = fields[2]
		birth_dates[name] = "#{month_day},#{year}"
	end
else
	puts "File '#{bdates}' does not exist"
end

puts "Whose Birthday would you like to look up?"
lookup = gets.chomp

if birth_dates.include? lookup
	bday = birth_dates[lookup]
	puts "#{lookup}'s next Birthday will be -#{bday}"
else
	puts "That name is not in your list.  Please try again!"
end
