class RailRoad
  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def header(str)
    puts "=========="
    puts "| #{str}"
    puts "=========="
  end

  # Navigation

  def menu
    header("Меню")
    puts '1 - Создание станций, поездов, вагонов и маршрутов'
    puts '2 - Операции с созданными объектами'
    puts '3 - Вывод информации об объектах'
    puts '0 - Выход'
    choise = gets.chomp.to_i
    return if choise == 0
    case choise
      when 1
        create
      when 2
        operations
      when 3
        info
      else
        puts "Неизвестная команда"
        menu
    end
  end

  def create
    header("Что необходимо создать?")
    puts "1 - станцию"
    puts "2 - маршрут"
    puts "3 - поезд"
    puts "0 - назад"
    choise = gets.chomp.to_i
    menu if choise == 0
    case choise
      when 1
        create_station
      when 2
        create_route
      when 3
        create_train
      else
        puts "Неизвестная команда"
        create
    end
  end

  def operations
    header("Выберите действие:")
    puts "1 - удалить станцию"
    puts "2 - добавить станцию в маршрут"
    puts "3 - добавить маршрут к поезду и перенести на 1ю станцию маршрута"
    puts "4 - отправить поезд на следующую станцию"
    puts "5 - отправить поезд на предыдущую станцию"
    puts "6 - прицепить вагон к поезду"
    puts "7 - отцепить вагон от поезда"
    puts "8 - загрузить вагон"
    puts "0 - назад"
    choise = gets.chomp.to_i
    menu if choise == 0
    case choise
      when 1
        delete_station
      when 2
        update_route
      when 3
        add_route_to_train
      when 4
        go_to_next_station
      when 5
        go_to_prev_station
      when 6
        add_new_carriage
      when 7
        remove_carriage
      when 8
        load_carriage
      else
        puts "Неизвестная команда"
        operations
    end
  end

  def info
    header("Вывод информации:")
    puts "1 - станции"
    puts "2 - маршруты"
    puts "3 - поезда"
    puts "4 - вагоны"
    puts "0 - назад"
    choise = gets.chomp.to_i
    menu if choise == 0
    case choise
      when 1
        show_stations_menu
      when 2
        show_routes
      when 3
        show_trains
      when 4
        show_carriages
      else
        puts "Неизвестная команда"
        info
    end
  end

  def show_stations_menu
    header("Выберите:")
    puts "1 - список станций"
    puts "2 - список поездов на станции"
    choise = gets.chomp.to_i
    case choise
      when 1
        show_stations
      when 2
        show_trains_on_station
      else
        puts "Неизвестная команда"
        show_stations_menu
    end
  end
  
  # Create actions
  
  def create_station
    begin
      puts "Введите название станции:"
      name = gets.chomp
      station = Station.new(name)
    rescue RuntimeError => err
      puts "Ошибка: #{err.message}"
      retry
    end
    @stations << station
    create
  end

  def create_route
    begin
      raise "Нельзя создавать маршрут без станций" if @stations.length < 2
    rescue RuntimeError => err
      puts "Ошибка: #{err.message}"
      create
    end
    begin
      puts "Название станции отправления"
      input_from = gets.chomp
      puts "Название станции назначения"
      input_to = gets.chomp
      from = @stations.find {|s| input_from == s.name}
      to = @stations.find {|s| input_to == s.name}
      route = Route.new(from, to)
    rescue RuntimeError => err
      puts "Ошибка: #{err.message}"
      retry
    end
      @routes << route
      puts @routes
      create
  end

  def create_train
    begin
      puts "Введите название поезда:"
      name = gets.chomp
      puts "Тип поезда (1 - пассажирский, 2 - грузовой)"
      type = gets.chomp.to_i
      if type == 1
        puts "Количество пассажирских мест в вагоне"
        seats = gets.chomp.to_i
      elsif type == 2
        puts "Объем грузового вагона"
        volume = gets.chomp.to_i
      end
      train = type == 1 ? PassengerTrain.new(name, seats) : CargoTrain.new(name, volume)
    rescue RuntimeError => err
      puts "Ошибка: #{err.message}"
      retry
    end
    @trains << train
    create
  end

  # Operations

  def delete_station
    puts "Введите номер станции"
    station = gets.chomp.to_i
    @stations.delete_at(station)
    operations
  end
  
  def update_route
    puts "Введите номер маршрута"
    route = gets.chomp.to_i
    puts "Введите номер станции"
    station = gets.chomp.to_i
    @routes[route].add_station(@stations[station])
    operations
  end
  
  def add_route_to_train
    if @routes.empty?
      puts "Сначала создайте маршрут"
      create
    end
    puts "Введите номер поезда"
    train = gets.chomp.to_i
    puts "Введите номер маршрута"
    route = gets.chomp.to_i
    @trains[train].add_route(@routes[route])
    operations
  end
 
  def go_to_next_station
    puts "Введите номер поезда"
    train = gets.chomp.to_i
    if !@trains[train].current_station
      puts "Для поезда не назначен маршрут"
      operations
    end
    @trains[train].move_forward
    operations
  end
 
  def go_to_prev_station
    puts "Введите номер поезда"
    train = gets.chomp.to_i
    if !@trains[train].current_station
      puts "Для поезда не назначен маршрут"
      operations
    end
    @trains[train].move_backward
    operations
  end
  
  def add_new_carriage
    puts "Введите номер поезда"
    train = gets.chomp.to_i
    type = @trains[train].type
    carriage = type == :passenger ? PassengerCarriage.new : CargoCarriage.new
    @trains[train].add_carriage(carriage)
    operations
  end
  
  def remove_carriage
    puts "Введите номер поезда"
    train = gets.chomp.to_i
    @trains[train].remove_carriage
    operations
  end

  def load_carriage
    puts "Введите номер поезда"
    train_number = gets.chomp.to_i
    train = @trains.find {|t| train_number == t.name}
    type = train.type

    puts "Введите номер вагона"
    carriage_number = gets.chomp.to_i
    carriage = train.carriages[carriage_number]

    if type == "Пассажирский"
      carriage.take_seat
    elsif type == "Грузовой"
      puts "Введите объем груза"
      volume = gets.chomp.to_i
      carriage.take_volume(volume)
    end
    operations
  end

  # Info actions

  def show_stations
    puts "Список станций:"
    @stations.each_with_index {|station, index| puts "#{index + 1}: #{station.name}"}
    info
  end

  def show_trains_on_station
    puts "Введите номер станции:"
    name = gets.chomp.to_i
    station = @stations.find {|s| name == s.name}
    station.each_train do |train|
      puts "Поезд № #{train.number} (#{train.type}), #{train.carriages.length} вагонов"
    end
    info
  end

  def show_trains
    puts "Список поездов:"
    @trains.each.with_index(1) {|train, index| puts "#{index}: #{train.number}"}
    info
  end

  def show_routes
    puts "Список маршрутов:"
    @routes.each.with_index(1) {|route, index| puts "#{index}: #{route.stations}"}
    info
  end

  def show_carriages
    puts "Введите номер поезда:"
    number = gets.chomp.to_i
    train = @trains.find {|t| number == t.name}
    type = train.type
    counter = 0
    if type == "Пассажирский"
      train.each_carriage do |carriage|
        puts "Вагон № #{counter += 1}"
        puts "Мест #{carriage.taken_seats}/#{carriage.seats}"
      end
    elsif type == "Грузовой"
      train.each_carriage do |carriage|
        puts "Вагон № #{counter += 1}"
        puts "Загружено #{carriage.loaded}/#{carriage.volume}" 
      end
    end
    info
  end
end
