require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'valid'

class Train
  include Manufacturer
  include InstanceCounter
  include Valid

  attr_accessor :speed
  attr_reader :current_station, :carriages, :number, :type

  @@trains = {}

  TYPES = {passenger: "Пассажирский", cargo: "Грузовой"}

  def initialize(number, type)
    @number = number
    @speed = 0
    @type = TYPES[type]
    @carriages = []
    @@trains[number] = self
    register_instance
    validate!
  end

  def self.find(number)
    @@trains[number]
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

  def each_carriage(&block)
    raise "No carriages" if @carriages.empty?
    @carriages.each { |carriage| yield(carriage) }
  end

  private
  # Вынесен в private, т.к. это вспомогательный метод, который не нужен в интерфейсе класса
  def current_station_index
    @route.stations.index(@current_station)
  end

  def correct_carriage_type?(carriage)
    carriage.type == @type
  end

  def validate!
    regexp = /^[а-яa-z0-9]{3}-?[а-яa-z0-9]{2}$/i

    raise "The \"number\" field cannot be empty" if number.length > 0
    raise "Wrong format of the \"number\" field (3 digits and/or letters,\
     hyphen (unnecessary), 2 digits and/or letters)" if number !~ regexp
    raise "Wrong carriage type (:passenger or :cargo)" unless ["Пассажирский", "Грузовой"].include? type
  end
end
