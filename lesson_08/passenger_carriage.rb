require_relative 'carriage'

class PassengerCarriage < Carriage
  def initialize(volume)
    super(:passenger, volume)
  end

  def take_volume
    super(1)
  end
end
