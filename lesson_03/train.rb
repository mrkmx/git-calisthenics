class Train
  attr_accessor :speed
  attr_reader :carriage_count, :train_type, :current_station

  TYPES = [:coach, :freight].freeze

  def initialize(name, train_type, carriage_count)
    @name = name
    @train_type = TYPES[train_type]
    @carriage_count = carriage_count
    @speed = 0
  end

  def stop
    @speed = 0
  end

  def add_carriage
    if @speed == 0
      @carriage_count += 1
    else
      puts "You cannot add carriages while the train is moving"
    end
  end

  def remove_carriage
    if @speed == 0
      @carriage_count -= 1 if @carriage_count > 1
    else
      puts "You cannot remove carriages while the train is moving"
    end
  end

  def add_route(route)
    @route = route
    @current_station = @route.stations.first

    # move train to 1st station in route
    @current_station.add_train(self)
  end

  def current_station_index
    @route.stations.index(@current_station)
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
end
