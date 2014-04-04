word_list = []

while true
  puts "Please enter a word: (Just press ENTER to exit) - " 
  cur_word = gets.chomp
  if cur_word.length == 0 
    break
  end
  word_list.push cur_word
end

if word_list.length > 0
  puts word_list.sort
else
  puts "No words entered!"
end