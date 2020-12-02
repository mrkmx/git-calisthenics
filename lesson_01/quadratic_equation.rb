puts "Enter variable \"a\""
a = Float(gets.chomp)

puts "Enter variable \"b\""
b = Float(gets.chomp)

puts "Enter variable \"c\""
c = Float(gets.chomp)

d = (b ** 2) - (4 * a * c)

if d > 0
  puts "d = #{d}, x1 = #{(-b + Math.sqrt(d)) / (2 * a)}, x2 = #{(-b - Math.sqrt(d)) / (2 * a)}"
elsif d == 0
  puts "d = #{d}, x1 = #{(-b + Math.sqrt(d)) / (2 * a)}"
else
  puts "No roots"
end