require 'dockingstation.rb'

describe DockingStation do

  subject(:dock_stat) {described_class.new}
  let(:bike) {double(:bike)}


  describe '#dock' do

      it 'User can dock a bike' do
        dock_stat.dock(bike)
        expect(dock_stat.bikes).to include(bike)
      end

  end

  describe '#release_bike' do

    it 'Releases a bike' do
      dock_stat.dock(bike)
      expect(dock_stat.release_bike).to eq(bike)
    end

    it 'raises an error if there are no bikes' do
      expect{dock_stat.release_bike}.to raise_error("Can't release bike: None available")
    end

  end

  describe 'max capacity' do
    it 'default of 20' do
      expect(dock_stat.capacity).to eq(20)
    end
  end


end
