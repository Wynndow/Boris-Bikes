require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity, :broken_bikes

  def initialize(capcity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capcity
  end

  def release_bike
    raise("Can't release bike: None available or broken") if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    raise("Docking station is full") if @bikes.length == DEFAULT_CAPACITY
    @bikes << bike
  end

  def dock_broken_bike(bike)
    bike.report_broken
    @broken_bikes << bike
  end

  def collect_broken_bikes
    give_bikes = @broken_bikes.map{|bike| bike}
    @broken_bikes.clear
    return give_bikes
  end

end
