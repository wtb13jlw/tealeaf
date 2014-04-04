seconds_per_day = 24 * 60 * 60  # hours x minutes per hour x seconds per minute
seconds_per_year = 365 * seconds_per_day
age_in_seconds = 1025000000

age = age_in_seconds / seconds_per_year

puts "The author is approximately " + age.to_s + " years old"
