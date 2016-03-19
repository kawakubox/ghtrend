require 'spec_helper'

describe Ghtrend do
  it 'has a version number' do
    expect(Ghtrend::VERSION).not_to be nil
  end

  describe :trend do
    it { expect(Ghtrend).to respond_to :trend }

    subject(:result) { Ghtrend.trend }
    it { is_expected.to be_kind_of Array }
    it 'has 25 elements' do expect(result.size).to eq 25 end

    describe 'return any element' do
      subject(:elem) { result.sample }
      it { is_expected.to be_kind_of Hash }
      it { is_expected.to be_has_key :name }
      it { is_expected.to be_has_key :url }
      it { is_expected.to be_has_key :description }
      it { is_expected.to be_has_key :meta }
    end
  end
end
