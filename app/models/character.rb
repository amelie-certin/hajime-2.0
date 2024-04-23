# frozen_string_literal: true

class Character < ApplicationRecord
  # Associations
  has_many :characters_weapons, dependent: :destroy
  has_many :weapons, through: :characters_weapons

  # Validations
  validates :name, presence: true
  validates :health, :defense, :strength, :focus, :speed, :charisma,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 200 }
  validates :arms, :legs, numericality: { greater_than_or_equal_to: 0 }

  def balanced?
    balance <= 200 && balance >= 175
  end

  def balance
    [health, defense, strength, focus, speed, charisma].sum
  end

  def limbs
    arms + legs
  end

  def ko?
    health.zero?
  end
end
