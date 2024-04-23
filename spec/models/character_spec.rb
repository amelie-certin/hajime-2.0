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

  describe 'balance' do
    let(:character) { build(:character, health: 1, strength: 2, defense: 4, focus: 8, speed: 16, charisma: 32) }

    subject { character.balance }

    it { is_expected.to eq(63) }
  end

  describe 'balanced?' do
    subject { character.balanced? }

    context 'when balanced >= 175 and <= 200' do
      let(:character) { build(:character, strength: 4, defense: 22, health: 74, focus: 99, speed: 1, charisma: 0) }

      it { is_expected.to eq(true) }
    end

    context 'when balanced < 175' do
      let(:character) { build(:character, strength: 4, defense: 22, health: 74, focus: 1, speed: 1, charisma: 0) }

      it { is_expected.to eq(false) }
    end

    context 'when balanced > 200' do
      let(:character) { build(:character, strength: 4, defense: 22, health: 74, focus: 99, speed: 1, charisma: 100) }

      it { is_expected.to eq(false) }
    end
  end

  describe 'limbs' do
    let(:character) { build(:character, legs: 2, arms: 3) }

    subject { character.limbs }

    it { is_expected.to eq(5) }
  end

  describe 'ko?' do
    subject { character.ko? }

    context 'when health > 0' do
      let(:character) { build(:character, health: 10) }

      it { is_expected.to eq(false) }
    end

    context 'when health == 0' do
      let(:character) { build(:character, health: 0) }

      it { is_expected.to eq(true) }
    end
  end
end
