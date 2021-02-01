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

  def take_volume(vol = 1)
    if vol == 1
      raise "not enough space" if vol + @loaded > @volume
      @loaded += vol
    else
      raise "all seats are taken" unless @loaded == @volume
      @loaded += 1
    end
  end

  def free_volume?
    @volume - @loaded
  end
end
