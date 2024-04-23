# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Weapon, type: :model do
  describe 'validations' do
    let(:weapon) { build(:weapon) }

    subject { weapon }

    it { is_expected.to be_valid }

    context 'without a name' do
      let(:weapon) { build(:weapon, name: nil) }

      it { is_expected.to_not be_valid }
    end

    context 'when focus is negative' do
      let(:weapon) { build(:weapon, focus: -20) }

      it { is_expected.to_not be_valid }
    end
  end
end
