# frozen_string_literal: true

class CharacterBuilder
  attr_writer :name, :health, :focus, :strength, :defense, :speed, :charisma, :legs, :arms

  def initialize(name: '', legs: 0, arms: 0)
    @name = name
    @health = 0
    @focus = 0
    @strength = 0
    @defense = 0
    @speed = 0
    @charisma = 0
    @arms = arms
    @legs = legs
  end

  def randomize(points_to_distribute: 200)
    points_left = points_to_distribute
    %w[health focus strength defense speed].each do |stat|
      distributed_points = rand(0..[points_left, 75].min)
      send "#{stat}=", distributed_points
      points_left -= distributed_points
    end
    @charisma = points_left
    self
  end

  # rubocop:disable Metrics/MethodLength
  def build
    Character.new(
      name: @name,
      health: @health,
      focus: @focus,
      strength: @strength,
      defense: @defense,
      speed: @speed,
      charisma: @charisma,
      arms: @arms,
      legs: @legs
    )
  end
  # rubocop:enable Metrics/MethodLength
end
