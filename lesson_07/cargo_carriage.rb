require_relative 'carriage'

attr_reader :loaded, :volume

class CargoCarriage < Carriage
  def initialize(volume)
    super(:cargo)
    @volume = volume
    @loaded = 0
  end

  def take_volume(vol)
    raise "not enough space" if vol + @loaded > @volume
    @loaded += vol
  end

  def free_volume?
    @volume - @loaded
  end
end