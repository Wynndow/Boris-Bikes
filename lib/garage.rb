class Garage


  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def receive_broken_bikes(bikes)
    bikes.each do |bike|
      @bikes << bike
    end
  end

  def fix_broken_bikes
    bikes.each do |bike|
      bike.fix
    end
  end

  def release_working_bikes
    working_bikes = bikes.select{|bike| bike.working}
    @bikes.delete_if{|bike| bike.working}
    return working_bikes
  end

end
