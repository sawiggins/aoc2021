require 'pry'

# movements = File.readlines('subset.txt').map { |n| n.split(" ") }.to_a
movements = File.readlines('input.txt').map { |n| n.split(" ") }.to_a

@forward = 0
@depth = 0
@aim = 0

# Part 1
def navigate(movements)
  movements.each do |movement|
    spaces = movement[1].to_i
    case movement[0]
    when "forward"
      @forward += spaces
    when "down"
      @depth += spaces
    when "up"
      @depth -= spaces
    else
      "Error"
    end
  end
end

# navigate(movements)

# Part 2
def navigate_with_aim(movements)
  movements.each do |movement|
    spaces = movement[1].to_i
    case movement[0]
    when "forward"
      @forward += spaces
      @depth += spaces * @aim
    when "down"
      @aim += spaces
    when "up"
      @aim -= spaces
    else
      "Error"
    end
  end
end

navigate_with_aim(movements)

solution = @forward * @depth
puts solution
