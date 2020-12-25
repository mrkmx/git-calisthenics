require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'station'
require_relative 'route'

# init
s1 = Station.new("Station 1")
s2 = Station.new("Station 2")
s3 = Station.new("Station 3")
r = Route.new(s1, s3)
tp_0 = Train.new("Default Pass Train", 0)
tc_0 = Train.new("Default Cargo Train", 1)
tp_1 = PassengerTrain.new("Descendant Pass Train")
tc_1 = CargoTrain.new("Descendant Cargo Train")
cp_0 = Carriage.new(0)       # Default Pass Carriage
cc_0 = Carriage.new(1)       # Default Cargo Carriage
cp_1 = PassengerCarriage.new # Descendant Pass Carriage
cc_1 = CargoCarriage.new     # Descendant Cargo Carriage

# add station "Station 2" to route
r.add_station(s2)
