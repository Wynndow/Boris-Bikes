require 'dockingstation.rb'

describe DockingStation do

  subject(:dock_stat) {described_class.new}
  let(:bike) {double(:bike)}

  before(:each) do
    allow(bike).to receive(:report_broken)
  end

  describe '#dock' do

      it 'User can dock a bike' do
        dock_stat.dock(bike)
        expect(dock_stat.bikes).to include(bike)
      end

      context 'when dock is full' do
        it 'raises an error' do
          20.times {dock_stat.dock(bike)}
            expect{dock_stat.dock(bike)}.to raise_error("Docking station is full")
        end
      end

  end

  describe '#dock_broken_bike' do
    it 'calls report on bike' do
      dock_stat.dock_broken_bike(bike)
      expect(bike).to have_received(:report_broken)
    end
  end

  describe '#release_bike' do

    it 'Releases a bike' do
      dock_stat.dock(bike)
      allow(bike).to receive(:working).and_return(true)
      expect(dock_stat.release_bike).to eq(bike)
    end

    it 'raises an error if there are no bikes' do
      expect{dock_stat.release_bike}.to raise_error("Can't release bike: None available or broken")
    end

    context 'if bike is broken' do
      it 'raises an error' do
        dock_stat.dock_broken_bike(bike)
        allow(bike).to receive(:working).and_return(false)
        expect{dock_stat.release_bike}.to raise_error("Can't release bike: None available or broken")
      end
    end
  end

  describe 'max capacity' do
    it 'default of 20' do
      expect(dock_stat.capacity).to eq(20)
    end

    it 'has a variable max capacity' do
      docking_station = DockingStation.new(30)
      expect(docking_station.capacity).to eq(30)
    end
  end

  describe 'give broken bikes' do
    it 'returns list of broken bikes' do
      dock_stat.dock_broken_bike(bike)
      expect(dock_stat.collect_broken_bikes).to include(bike)
    end
    it 'empties docking station' do
      dock_stat.dock_broken_bike(bike)
      dock_stat.collect_broken_bikes
      expect(dock_stat.broken_bikes).to be_empty
    end
  end

  describe '#receive_working_bikes' do
    it 'stores delivered working bikes' do
      dock_stat.receive_working_bikes([bike])
      expect(dock_stat.bikes).to include(bike)
    end
  end

end
