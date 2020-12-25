require_relative 'carriage'

class PassengerCarriage < Carriage
  def initialize
    super(0) # TYPES[0] == :paasenger
  end
end
