# frozen_string_literal: true

class Weapon < ApplicationRecord
  # Associations
  has_many :characters_weapons, dependent: :destroy
  has_many :characters, through: :characters_weapons

  # Validations
  validates :name, presence: true
  validates :arms, :legs, :focus, :power, numericality: { greater_than_or_equal_to: 0 }
end
