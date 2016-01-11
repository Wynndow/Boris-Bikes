require 'van.rb'

describe Van do
  subject(:van) {described_class.new}
  let(:dock_stat) {double(:dock_stat) }
  let(:garage) {double(:garage)}
  let(:bike) {double(:bike, :working => false)}

  before do
    allow(dock_stat).to receive(:collect_broken_bikes).and_return([bike])
    allow(garage).to receive(:receive_broken_bikes).and_return([bike])
    allow(garage).to receive(:release_working_bikes).and_return([bike])
  end

  describe 'picks up broken bikes' do
    it 'calls collect broken bikes on docking station' do
      van.pick_up_broken_bikes(dock_stat)
      expect(dock_stat).to have_received(:collect_broken_bikes)
    end
    it 'contains broken bikes' do
      van.pick_up_broken_bikes(dock_stat)
      expect(van.bikes).to include(bike)
    end
  end

  describe '#deliver' do
    it 'calls receive_broken_bikes on the garage' do
      van.pick_up_broken_bikes(dock_stat)
      van.deliver(garage)
      expect(garage).to have_received(:receive_broken_bikes)
    end

    it 'clears the van of bikes' do
      van.pick_up_broken_bikes(dock_stat)
      van.deliver(garage)
      expect(van.bikes).to be_empty
    end
  end

  describe '#pick_up_working_bikes' do
    it 'calls release_working_bikes on garage' do
      van.pick_up_working_bikes(garage)
      expect(garage).to have_received(:release_working_bikes)
    end
  end

end
