require_relative 'train'

class PassengerTrain < Train
  def initialize(name)
    super(name, 0) # TYPES[0] == :passenger
  end
end