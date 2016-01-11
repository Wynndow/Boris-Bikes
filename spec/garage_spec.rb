require 'garage.rb'

describe Garage do
  subject(:garage) {described_class.new}
  let(:bike) {double(:bike)}

  describe '#receive_broken_bikes' do
    it 'stores bikes received' do
      garage.receive_broken_bikes([bike])
      expect(garage.bikes).to include(bike)
    end
  end

end
