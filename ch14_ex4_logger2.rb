$ctr = 0
def log(desc, block)
	tabs = "\t" * $ctr
  puts "#{tabs}Beginning '#{desc}'..."
  $ctr += 1
  return_val = block.call
  puts "#{tabs}...'#{desc}'' has finished, returning:"
  puts "#{tabs}-------> #{return_val}"
end

inner_block = Proc.new do
  sport = "I spy with my little eye,"
end

middle_block = Proc.new do
	log("Inner Block", inner_block)
  sport = "Something beginning with a 'T'"
end

outer_block = Proc.new do
  log("Middle Block", middle_block)
  name = "Tank?!  -  Yes, Comrade!"
end

log("Outer Block", outer_block)
