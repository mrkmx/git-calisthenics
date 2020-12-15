require './station'
require './route'
require './train'
# init
s1 = Station.new("Station 1")
s2 = Station.new("Station 2")
s3 = Station.new("Station 3")
t1 = Train.new("Train 1", 0, 12)
t2 = Train.new("Train 2", 1, 15)
t3 = Train.new("Train 3", 0, 8)
r = Route.new(s1, s3)

# add station to route
r.add_station(s2)

# add route to train
t1.add_route(r)

puts "s1: #{s1.trains}"
puts "s2: #{s2.trains}"
t1.move_forward
puts "=========================="
puts "s1: #{s1.trains}"
puts "s2: #{s2.trains}"
t1.move_backward
puts "=========================="
puts "s1: #{s1.trains}"
puts "s2: #{s2.trains}"

# testing stations
t2.add_route(r)
t3.add_route(r)
s1.count_trains_by_type(:coach)
s1.count_trains_by_type(:freight)

t4 = Train.new("Train 4", 0, 15)
t4.add_route(r)
t4.move_forward
puts t4.prev_station
puts t4.current_station
puts t4.next_station