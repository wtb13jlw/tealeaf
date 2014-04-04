toc = [["1", "Getting Started", "1"],
       ["2", "Numbers", "9"],
	   ["3", "Letters", "13"]]
line_width = 53
puts "Table of Contents\n".center(line_width)
toc.each do |content|
  chapter_number = " Chapter " + content[0] + ":"
  chapter_title = content[1]
  chapter_start_page = content[2]  
  puts chapter_number.ljust(12) + " " + chapter_title.ljust(25) + "  page " + chapter_start_page.rjust(2)
end