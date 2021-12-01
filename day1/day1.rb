require 'pry'

# depths = File.readlines('subset.txt').collect(&:to_i)
depths = File.readlines('input.txt').collect(&:to_i)

@num_increased = 0
@sum_increased = 0

# Part 1
# TIL each_cons: https://apidock.com/ruby/Enumerable/each_cons
def increased(depths)
  depths.each_cons(2) do |depths|
    @num_increased += 1 if depths[0] < depths[1]
  end
end

# increased(depths)
# puts @num_increased

# Part 2
def sliding_sums(depths)
  sums = depths.each_cons(3).map(&:sum) 
  sums.each_cons(2) do |depths|
    @sum_increased += 1 if depths[0] < depths[1]
  end
end

sliding_sums(depths)
puts @sum_increased
