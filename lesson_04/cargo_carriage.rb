require_relative 'carriage'

class CargoCarriage < Carriage
  def initialize
    super(1) # TYPES[1] == :cargo
  end
end