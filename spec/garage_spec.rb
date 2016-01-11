require 'garage.rb'

describe Garage do
  subject(:garage) {described_class.new}
  let(:bike) {double(:bike, :fix => true, :working => true)}

  describe '#receive_broken_bikes' do
    it 'stores bikes received' do
      garage.receive_broken_bikes([bike])
      expect(garage.bikes).to include(bike)
    end
  end

  describe '#fix_broken_bikes' do
    it 'received bikes get fixed upon calling method' do
      garage.receive_broken_bikes([bike])
      garage.fix_broken_bikes
      expect(bike).to have_received(:fix)
    end
  end

  describe '#release_working_bikes' do
    it 'returns broken bikes for collection' do
      garage.receive_broken_bikes([bike])
      garage.fix_broken_bikes
      expect(garage.release_working_bikes).to eq([bike])
    end
    it 'garage is empty of working bikes' do
      garage.receive_broken_bikes([bike])
      garage.fix_broken_bikes
      garage.release_working_bikes
      expect(garage.bikes).to be_empty
    end
  end

end
