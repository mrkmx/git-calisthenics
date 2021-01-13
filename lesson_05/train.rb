require_relative 'manufacturer.rb'

class Train
  include Manufacturer

  attr_accessor :speed
  attr_reader :current_station, :carriages, :name, :type

  TYPES = {passenger: "Пассажирский", cargo: "Грузовой"}

  def initialize(name, type)
    @name = name
    @speed = 0
    @type = TYPES[type]
    @carriages = []
  end

  def stop
    @speed = 0
  end

  def stopped?
    @speed == 0
  end

  def add_carriage(carriage)
    if stopped? && correct_carriage_type?(carriage)
      @carriages << carriage
    end
  end

  def remove_carriage
    if stopped?
      @carriages.pop if @carriages.length > 1
    end
  end

  def add_route(route)
    @route = route
    @current_station = @route.stations.first

    # move train to 1st station in route
    @current_station.add_train(self)
  end

  def move_forward
    return if @route.stations[current_station_index] == @route.stations.last

    @current_station.remove_train(self)
    @current_station = @route.stations[current_station_index + 1]
    @current_station.add_train(self)
  end

  def move_backward
    return if @route.stations[current_station_index] == @route.stations.first

    @current_station.remove_train(self)
    @current_station = @route.stations[current_station_index - 1]
    @current_station.add_train(self)
  end

  def next_station
    @route.stations[current_station_index + 1]
  end
  
  def prev_station
    @route.stations[current_station_index - 1]
  end

  private
  # Вынесен в private, т.к. это вспомогательный метод, который не нужен в интерфейсе класса
  def current_station_index
    @route.stations.index(@current_station)
  end

  def correct_carriage_type?(carriage)
    carriage.type == @type
  end
end
