# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Station
  include InstanceCounter
  include Validation

  @@stations = []

  attr_reader :trains, :name
  validate :name, :presence
  validate :name, :validate_type, String

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
    counter = @trains.count { |t| type == t.train_type }
    puts "#{counter} #{type} trains on \"#{@name}\""
  end

  def add_train(train)
    @trains << train
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def each_train
    return if @trains.empty?

    @trains.each { |train| yield(train) }
  end
end
