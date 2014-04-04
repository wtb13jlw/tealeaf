seconds_per_day = 24 * 60 * 60
seconds_per_year = 365 * seconds_per_day
age = 54
number_of_leap_years = age / 4
age_in_seconds = (age * seconds_per_day) + (number_of_leap_years * seconds_per_day)

puts "At " + age.to_s + " years of age, I am approximately " + age_in_seconds.to_s + " seconds old."
#puts "If I was born on a leap year," 
#puts "then I would be " + (age_in_seconds + seconds_per_day).to_s + " seconds old."
