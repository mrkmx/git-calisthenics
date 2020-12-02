COEFFICIENT1 = 110
COEFFICIENT2 = 1.15

puts "Enter your name"
name = gets.chomp.capitalize

puts "Enter your height"
height = gets.chomp.to_f

ideal_weight = (height - COEFFICIENT1) * COEFFICIENT2

if ideal_weight < 0
  puts "Hey, #{name}! Your ideal weight is #{ideal_weight}kg"
else
  puts "Your weight is already optimal"
end
