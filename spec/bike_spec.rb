require 'bike.rb'

describe Bike do

  subject(:bike){described_class.new}

  it 'New bike is working' do
    expect(bike.working).to eq(true)
  end

  describe '#report_broken' do
    it 'changes working status of bike to false' do
        bike.report_broken
        expect(bike.working).to be(false)
    end
  end

end
