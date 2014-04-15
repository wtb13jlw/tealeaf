def log(desc, block)
  puts "Beginning '#{desc}'..."
  return_val = block.call
  puts "...'#{desc}'' has finished, returning:"
  puts return_val
end

inner_block = Proc.new do
  sport = "Favorite Sport is Hockey"
end

outer_block = Proc.new do
  log("Inner Block",inner_block)
  name = "Name is Jeff"
end

log("Outer Block", outer_block)
