""" Assuming that a decade starts on the 10s and its definition is not
  any 10 years, then there will always be at least two leap years. (2 and 6,
  or 4 and 8)  In even decades 20, 40 , 60, and 80, those will years also be 
  leap years.  The 00 starts will be dependant on whether the century is 
  divisible by 400.  We will stick with the typical. """
puts "There are " + (((10 * 365) + 2) * 1440).to_s + " minutes in a decade" 
