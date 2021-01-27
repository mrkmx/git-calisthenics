require_relative 'instance_counter'

class Route
  include InstanceCounter

  attr_reader :stations

  def initialize(from, to)
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
end
