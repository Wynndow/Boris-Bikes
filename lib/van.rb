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

  def deliver(location)
    if @bikes.all? {|bike| bike.working == true}
      location.receive_working_bikes(@bikes)
    else
      location.receive_broken_bikes(@bikes)
    end
    @bikes.clear
  end

  def pick_up_working_bikes(garage)
    garage.release_working_bikes.each do |bike|
      @bikes << bike
    end
  end

end
