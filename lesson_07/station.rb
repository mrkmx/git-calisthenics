require_relative 'instance_counter'
require_relative 'valid'

class Station
  include InstanceCounter
  include Valid

  @@stations = []

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
    register_instance
  end

  def self.all
    @@stations
  end

  def count_trains_by_type(type)
    counter = @trains.count {|t| type == t.train_type}
    puts "#{counter} #{type} trains on \"#{@name}\""
  end
  
  def add_train(train)
    @trains << train
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def each_train(&block)
    return if @trains.empty?
    @trains.each { |train| yield(train) }
  end

  private
  
  def validate!
    raise "The \"name\" field cannot be empty" unless name
  end
end
