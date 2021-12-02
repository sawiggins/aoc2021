require 'pry'

# movements = File.readlines('subset.txt').map { |n| n.split(" ") }.to_a
movements = File.readlines('input.txt').map { |n| n.split(" ") }.to_a
# print movements

@forward = 0
@depth = 0
@aim = 0

# Part 1
def navigate(movements)
  movements.each do |movement|
    case movement[0]
    when "forward"
      @forward += movement[1].to_i
    when "down"
      @depth += movement[1].to_i
    when "up"
      @depth -= movement[1].to_i
    else
      "Error"
    end
  end
end

# navigate(movements)

# puts @forward
# puts @depth


# Part 2
def navigate_with_aim(movements)
  movements.each do |movement|
    case movement[0]
    when "forward"
      @forward += movement[1].to_i
      @depth += movement[1].to_i * @aim
    when "down"
      @aim += movement[1].to_i
    when "up"
      @aim -= movement[1].to_i
    else
      "Error"
    end
  end
end

navigate_with_aim(movements)

solution = @forward * @depth
puts solution
