class Van

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def pick_up_broken_bikes(station)
    station.collect_broken_bikes.each do |bike|
    @bikes << bike
    end
  end

  def deliver(garage)
    garage.receive_broken_bikes(@bikes)
    @bikes.clear
  end
end
