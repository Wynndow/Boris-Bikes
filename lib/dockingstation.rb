require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity


  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    raise("Can't release bike: None available") if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    @bikes << bike
  end

end
