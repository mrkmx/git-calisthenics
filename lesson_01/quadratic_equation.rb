puts "Enter variable \"a\""
a = gets.chomp.to_f

puts "Enter variable \"b\""
b = gets.chomp.to_f

puts "Enter variable \"c\""
c = gets.chomp.to_f

d = (b ** 2) - (4 * a * c)
sqrt_d = Math.sqrt(d)

if d > 0
  puts "d = #{d}, x1 = #{(-b + sqrt_d) / (2 * a)}, x2 = #{(-b - sqrt_d) / (2 * a)}"
elsif d == 0
  puts "d = #{d}, x1 = #{(-b + sqrt_d) / (2 * a)}"
else
  puts "No roots"
end