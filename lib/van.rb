class Van

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def pick_up(station)
    station.collect_broken_bikes.each do |bike|
    @bikes << bike
    end
  end

end
