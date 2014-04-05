def sort_list(list_to_sort)
  main_sort_list(list_to_sort, []) 
    
end

def main_sort_list(list_to_sort, sorted_list)
  if list_to_sort.length == 0
    return sorted_list
  end

  lowest_item = list_to_sort.pop
  unsorted_list = []
  
  list_to_sort.each do |item_to_test|
    if item_to_test.downcase < lowest_item.downcase
      unsorted_list.push lowest_item
      lowest_item = item_to_test
    else
      unsorted_list.push item_to_test
	  end
  end

  sorted_list.push lowest_item      
  main_sort_list(unsorted_list, sorted_list)
  
end

word_list = []
while true
  puts "Please enter a word: (just ENTER to exit) - " 
  cur_word = gets.chomp
  if cur_word.length == 0
    break
  end
  word_list.push cur_word
end

sorted_words = sort_list(word_list)

sorted_words.each do |i|
  puts i
end