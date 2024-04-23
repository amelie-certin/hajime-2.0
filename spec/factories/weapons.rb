# frozen_string_literal: true

FactoryBot.define do
  factory :weapon do
    name { 'Wouf' }
    arms { 0 }
    legs { 4 }
    focus { 35 }
    power { 25 }
  end
end
