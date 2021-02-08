# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation

  attr_reader :stations
  validate :stations, :presence
  validate :stations, :type, Array

  def initialize(from, to)
    @from = from
    @to = to
    @stations = [@from, @to]
    register_instance
    validate!
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station) unless [@from, @to].include?(station)
  end

  private

end
