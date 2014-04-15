class OrangeTree
 
  def initialize
    @age = 0
    @orange_count = 0
    @tree_height = 0
    one_year_passes
  end

  def height
  	# return in feet
  	return @tree_height / 12
  end

  def count_the_oranges
  	return @orange_count
  end
  
  def one_year_passes
  	@age += 1
  	# these are arbitrary values
    @tree_height += 48
    @orange_count = ((12 * @age) * 1.2) if @age > 4
    
  end

  def pick_an_orange
  	@orange_count -= 1

  end
end

florida = OrangeTree.new
puts florida.count_the_oranges
puts florida.height
florida.one_year_passes
florida.one_year_passes
florida.one_year_passes
florida.one_year_passes
florida.one_year_passes
puts florida.count_the_oranges
puts florida.height
florida.one_year_passes
florida.one_year_passes
puts florida.count_the_oranges
puts florida.height
12.times  { florida.pick_an_orange } 
puts florida.count_the_oranges