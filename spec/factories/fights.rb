# frozen_string_literal: true

FactoryBot.define do
  factory :fight do
    association :player, factory: :character
    association :opponent, factory: :character
  end
end
