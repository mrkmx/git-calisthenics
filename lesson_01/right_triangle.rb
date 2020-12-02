puts "Enter the side \"a\" of a triangle"
a = gets.chomp.to_i

puts "Enter the side \"b\" of a triangle"
b = gets.chomp.to_i

puts "Enter the side \"c\" of a triangle"
c = gets.chomp.to_i

side1, side2, hypotenuse = [a, b, c].sort

if a == b && a == c
  # i.e. 1, 1, 1
  puts "Equilateral triangle"
elsif a == b || a == c || b == c
  # i.e. 1, 2, 1
  puts "isosceles triangle"
elsif hypotenuse ** 2 == side1 ** 2 + side2 ** 2
  # i.e. 3, 4, 5
  puts "right triangle"
else
  # i.e. 5, 6, 7
  puts "other triangle"
end
