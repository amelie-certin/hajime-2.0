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
  validate :check_balance
  validate :check_enough_limbs

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_fill: [400, 400]
  end

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
    health <= 0
  end

  def weapon_power
    weapons.sum(&:power)
  end

  def punch_power
    weapon_power + strength
  end

  def weapon_focus
    weapons.sum(&:focus)
  end

  private

  def check_balance
    return if balanced?

    errors.add(:balance, :unbalanced)
  end

  def check_enough_limbs
    armed_arms = weapons.sum(&:arms)
    armed_legs = weapons.sum(&:legs)

    return if arms >= armed_arms || legs >= armed_legs

    errors.add(:limbs, :not_enough_free_limbs)
  end
end
