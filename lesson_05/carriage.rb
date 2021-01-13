class Carriage
  attr_reader :type
  
  TYPES = {passenger: "Пассажирский", cargo: "Грузовой"}

  def initialize(type)
    @type = TYPES[type]
  end
end
