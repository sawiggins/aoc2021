require 'pry'

# lanternfish = File.read('subset.txt').chomp.split(',').map(&:to_i)
lanternfish = File.read('input.txt').chomp.split(',').map(&:to_i)

@population_count = Hash[(0..8).map { |k| [k, 0]}]

# Part 1 & 2
def population(fish)
  population_count = Hash[(0..8).map { |k| [k, 0]}]
  fish.map{ |fish| population_count[fish] += 1 }

  days = 255
  while days >= 0
    restart_next_time = 0
    keys = (0..8)
    spawn_now = population_count[0]
    restart_next_time = population_count[0]
    new_population = population_count.values.drop(1)
    new_population << spawn_now
    population_count = keys.zip(new_population).to_h
    population_count[6] = population_count[6] + restart_next_time
    days -= 1
  end
  puts population_count.values.sum
end

population(lanternfish)
