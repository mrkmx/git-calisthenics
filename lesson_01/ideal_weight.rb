coefficient1 = 110
coefficient2 = 1.15

puts "Enter your name"
name = gets.chomp

puts "Enter your height"
height = Float(gets.chomp)

ideal_weight = (height - coefficient1) * coefficient2

if ideal_weight < 0
  puts "Hey, #{name.capitalize}! Your ideal weight is #{ideal_weight}kg"
else
  puts "Your weight is already optimal"
end
