require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise("Can't release bike: None available") if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    @bikes << bike
  end

end
