require_relative 'carriage'

attr_reader :taken_seats, :seats

class PassengerCarriage < Carriage
  def initialize(seats)
    super(:passenger)
    @seats = seats
    @taken_seats = 0
  end

  def take_seat
    raise "all seats are taken" unless @taken_seats == @seats
    @taken_seats += 1
  end

  def free_seats?
    @seats - taken_seats
  end
end
