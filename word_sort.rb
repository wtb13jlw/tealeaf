word_list = []

def sort_list list_to_sort
  sorted_list = []
  unsorted_list = list_to_sort
  lowest_item = "\255"
  new_list = main_sort_list unsorted_list, sorted_list, lowest_item 
    
  return new_list
end

def main_sort_list unsorted_list, sorted_list, lowest_item
  if unsorted_list == 0
    return sorted_list
  end
  item_pos = 0
  lowest_item_pos = 0
  unsorted_list.each do |item_in_list|
    puts item_in_list
    #if item_in_list < lowest_item
    #  lowest_item = item_in_list
    #  lowest_item_pos = item_pos
	#end
    item_pos += 1
        
    sorted_list.append(lowest_item)
    unsorted_list.pop(lowest_item_pos)
    
    sorted_list = main_sort_list unsorted_list, sorted_list, "\255"
    return sorted_list
  end
end

counter = 0
while true
  counter += 1
  puts "Please enter a word: (quit to exit) - " 
  cur_word = gets.chomp
  if cur_word == "quit"
    break
  end
  word_list[counter] = cur_word
end

sorted_words = sort_list(word_list)
puts sorted_words

sorted_words.each do |i|
  print i
end