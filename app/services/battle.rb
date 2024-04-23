# frozen_string_literal: true

class Battle
  def initialize(player:, opponent:)
    @player = player
    @opponent = opponent
    @fighters = [player, opponent].sort_by { |character| -(character.speed + (character.legs * 2)) }
    @turn = 0
  end

  def self.run(player:, opponent:)
    battle = new(player:, opponent:)
    battle.run
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def run
    until any_fighters_ko?
      if (attacker.charisma + rand(-10..40)).positive?
        used_focus = required_focus
        if used_focus > 50
          defender.health -= critical_hit
        elsif used_focus >= 10
          defender.health -= hit
        elsif used_focus < 10
          attacker.health -= critical_fail
        end
      end

      @turn += 1
    end

    { winner: @fighters[0].ko? ? :opponent : :player }
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def any_fighters_ko?
    @fighters.any?(&:ko?)
  end

  def attacker
    @fighters[@turn % 2]
  end

  def defender
    @fighters[(@turn + 1) % 2]
  end

  def required_focus
    attacker.focus - (attacker.limbs + attacker.weapon_focus + rand(-40..30))
  end

  def critical_hit
    attacker.punch_power + 10 - defender.defense
  end

  def critical_fail
    attacker.weapon_power
  end

  def hit
    attacker.punch_power - defender.defense
  end
end
