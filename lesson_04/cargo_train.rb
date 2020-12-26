require_relative 'train'

class CargoTrain < Train
  def initialize(name)
    super(name, :cargo)
  end
end