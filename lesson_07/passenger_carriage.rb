require_relative 'carriage'

class PassengerCarriage < Carriage
  def initialize(volume)
    super(:passenger, volume)
  end
end
