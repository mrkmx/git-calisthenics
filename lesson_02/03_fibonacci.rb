# without recursion
arr = [0, 1]

while arr[-2] + arr[-1] < 100 do
  arr << arr[-2] + arr[-1]
end

print arr
