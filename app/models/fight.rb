# frozen_string_literal: true

class Fight < ApplicationRecord
  # Associations
  belongs_to :player, class_name: :Character, foreign_key: :player_id
  belongs_to :opponent, class_name: :Character, foreign_key: :opponent_id

  # Validations
  validate :check_different_competitors

  enum winner: enum_string_hash(:player, :opponent)

  private

  def check_different_competitors
    return if player_id != opponent_id

    errors.add(:opponent, :identical)
  end
end
