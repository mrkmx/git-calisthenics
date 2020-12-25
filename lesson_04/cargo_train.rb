require_relative 'train'

class CargoTrain < Train
  def initialize(name)
    super(name, 1) # TYPES[1] == :cargo
  end
end