# without recursion
arr = []
current_int = 0
next_int = 1

loop do
  tmp = current_int
  current_int = next_int
  next_int = tmp + next_int
  break if current_int >= 100
  arr << current_int 
end

print arr
