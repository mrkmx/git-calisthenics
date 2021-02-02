require_relative 'carriage'

class CargoCarriage < Carriage
  def initialize(volume)
    super(:cargo, volume)
  end
end
