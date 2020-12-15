class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def count_trains_by_type(type)
    counter = @trains.count {|t| type == t.train_type}
    puts "#{counter} #{type} trains on \"#{@name}\""
  end
end
