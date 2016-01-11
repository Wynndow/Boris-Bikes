require 'bike.rb'

describe Bike do

  subject(:bike){described_class.new}

  it 'New bike is working' do
    expect(bike.working).to eq(true)
  end

end
