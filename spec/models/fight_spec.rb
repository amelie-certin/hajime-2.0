# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fight, type: :model do
  describe 'validations' do
    describe 'opponent' do
      let_it_be(:character1) { create(:character) }
      let_it_be(:character2) { create(:character) }

      let(:fight) { build(:fight, player: character1, opponent: character2) }

      subject { fight }

      it { is_expected.to be_valid }

      context 'when player and opponent are the same characters' do
        let(:fight) { build(:fight, player: character1, opponent: character1) }

        it { is_expected.to_not be_valid }
      end

      context 'when opponent is absent' do
        let(:fight) { build(:fight, player: character1, opponent: nil) }

        it { is_expected.to_not be_valid }
      end

      context 'when player is absent' do
        let(:fight) { build(:fight, player: nil, opponent: character2) }

        it { is_expected.to_not be_valid }
      end
    end
  end
end
