# frozen_string_literal: true

class CharactersWeapon < ApplicationRecord
  # Associations
  belongs_to :character
  belongs_to :weapon
end
