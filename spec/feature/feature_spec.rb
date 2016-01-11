require 'bike.rb'
require 'dockingstation.rb'
require 'garage.rb'
require 'van.rb'


describe 'Feature test' do

  let(:bike) {Bike.new}
  let(:dock_stat) {DockingStation.new}
  let(:garage) {Garage.new}
  let(:van) {Van.new}

  it 'feature' do
    dock_stat.dock_broken_bike(bike)
    van.pick_up_broken_bikes(dock_stat)
    expect(dock_stat.broken_bikes).to be_empty
    van.deliver(garage)
    expect(van.bikes).to be_empty
    expect(garage.bikes).to include(bike)
  end

end
