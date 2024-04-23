# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'validations' do
    let(:character) { build(:character) }

    subject { character }

    it { is_expected.to be_valid }

    context 'without a name' do
      let(:character) { build(:character, name: nil) }

      it { is_expected.to_not be_valid }
    end

    context 'when health is negative' do
      let(:character) { build(:character, health: -20) }

      it { is_expected.to_not be_valid }
    end

    context 'when strength is above 200' do
      let(:character) { build(:character, strength: 270) }

      it { is_expected.to_not be_valid }
    end
  end
end
