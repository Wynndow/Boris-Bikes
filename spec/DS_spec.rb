require 'dockingstation.rb'

describe DockingStation do

  subject(:dock_stat) {described_class.new}
  let(:bike) {double(:bike)}

  it 'Responds to release bike method' do
    expect(dock_stat).to respond_to(:release_bike)
  end

  it 'Releases a bike' do
    dock_stat.dock(bike)
    expect(dock_stat.release_bike).to eq(bike)
  end

  it 'User can dock a bike' do
    dock_stat.dock(bike)
    expect(dock_stat.bikes).to include(bike)
  end



end
