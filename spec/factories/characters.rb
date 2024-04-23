# frozen_string_literal: true

FactoryBot.define do
  factory :character do
    name { 'Doggo' }
    strength { 21 }
    defense { 47 }
    health { 35 }
    focus { 29 }
    speed { 32 }
    charisma { 36 }
    legs { 4 }
    arms { 0 }
  end
end
