require_relative 'instance_counter'
require_relative 'valid'

class Route
  include InstanceCounter
  include Valid

  attr_reader :stations

  def initialize(from, to)
    validate!
    @from = from
    @to = to
    @stations = [@from, @to]
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station) unless [@from, @to].include?(station)
  end

  private

  def validate!
    raise "You must set up a departure station" if from.nil?
    raise "You must set up an arrival station" if to.nil?
  end
end
