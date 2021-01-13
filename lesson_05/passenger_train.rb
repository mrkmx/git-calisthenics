require_relative 'train'

class PassengerTrain < Train
  def initialize(name)
    super(name, :passenger)
  end
end