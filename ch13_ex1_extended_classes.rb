class Array

  def myshuffle
    main_shuffle(self, [])
  end

  def main_shuffle(unshuffled, shuffled)
    if unshuffled.length == 0
      return shuffled
    end
  
    item_to_extract = rand(unshuffled.length)
    to_be_shuffled = []
    counter = 0
  
    unshuffled.each do |test_item|
      if item_to_extract == counter
	    shuffled.push(test_item)
	  else
	    to_be_shuffled.push(test_item)
	    end
	  
    counter += 1
    end	    
    main_shuffle(to_be_shuffled, shuffled)
  end 
end

card_list = (['Ace','2','3','4','5','6','7','8','9','10','Jack','Queen','King'])

mycard_list = card_list.myshuffle

mycard_list.each do |i|
  puts i
end