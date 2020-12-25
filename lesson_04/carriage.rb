class Carriage
  attr_reader :type
  
  TYPES = [:passenger, :cargo].freeze

  def initialize(type)
    @type = TYPES[type]
  end
end
