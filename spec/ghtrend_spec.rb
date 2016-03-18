require 'spec_helper'

describe Ghtrend do
  it 'has a version number' do
    expect(Ghtrend::VERSION).not_to be nil
  end

  describe :trend do
    it { expect(Ghtrend).to respond_to :trend }
  end
end
