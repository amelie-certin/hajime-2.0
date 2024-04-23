# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CharacterBuilder do
  describe 'build' do
    let(:builder) { described_class.new }
    let(:character) { builder.build }

    context 'without randomization' do
      it 'builds a character' do
        expect(character).to be_a(Character)
        expect(character.balance).to eq(0)
      end
    end

    context 'with randomization' do
      context 'whith no given points_to_distribute' do
        before { builder.randomize }

        it 'builds a character' do
          expect(character).to be_a(Character)
          expect(character.balance).to eq(200)
        end
      end

      context 'whith a custom points_to_distribute' do
        before { builder.randomize(points_to_distribute: 460) }

        it 'builds a character' do
          expect(character).to be_a(Character)
          expect(character.balance).to eq(460)
        end
      end
    end
  end
end
