require 'van.rb'

describe Van do
  subject(:van) {described_class.new}
  let(:dock_stat) {double(:dock_stat, :collect_broken_bikes => [:bike]) }

  describe 'picks up broken bikes' do
    it 'calls collect broken bikes on docking station' do
      van.pick_up(dock_stat)
      expect(dock_stat).to have_received(:collect_broken_bikes)
    end
    it 'contains broken bikes' do
      van.pick_up(dock_stat)
      expect(van.bikes).to include(:bike)
    end
  end

end
