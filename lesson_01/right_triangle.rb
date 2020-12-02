puts "Enter the side \"a\" of a triangle"
a = Integer(gets.chomp)

puts "Enter the side \"b\" of a triangle"
b = Integer(gets.chomp)

puts "Enter the side \"c\" of a triangle"
c = Integer(gets.chomp)

if a == b && a == c
  # i.e. 1, 1, 1
  puts "Equilateral triangle"
elsif a == b || a == c || b == c
  # i.e. 1, 2, 1
  puts "isosceles triangle"
elsif (a ** 2 == b ** 2 + c ** 2) || (b ** 2 == a ** 2 + c ** 2) || (c ** 2 == b ** 2 + a ** 2)
  # i.e. 3, 4, 5
  puts "right triangle"
else
  # i.e. 5, 6, 7
  puts "other triangle"
end
