require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity


  def initialize(capcity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capcity
  end

  def release_bike
    raise("Can't release bike: None available") if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    raise("Docking station is full") if @bikes.length == DEFAULT_CAPACITY
    @bikes << bike
  end

  def dock_broken_bike(bike)
    bike.report_broken
    @bikes << bike
  end

end
