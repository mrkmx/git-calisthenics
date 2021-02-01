require_relative 'manufacturer'

class Carriage
  include Manufacturer
  
  attr_reader :type, :loaded, :volume
  
  TYPES = {passenger: "Пассажирский", cargo: "Грузовой"}

  def initialize(type, volume)
    @type = TYPES[type]
    @volume = volume
    @loaded = 0
  end

  def take_volume(volume = 1)
    raise "not enough space"  if vol > free_volume
    
    @loaded += vol
  end

  def free_volume
    @volume - @loaded
  end
end
