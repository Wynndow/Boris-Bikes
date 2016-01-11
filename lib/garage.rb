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



end
