# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

characters = [
  { name: 'Grumpy cat', legs: 4, arms: 0 },
  { name: 'Arthur', legs: 2, arms: 2 },
  { name: 'Doggo', legs: 4, arms: 0 },
  { name: 'Nyan cat', legs: 2, arms: 2 },
  { name: 'Lamasticot', legs: 0, arms: 0 }
].map do |attributes|
  CharacterBuilder
    .new(name: attributes[:name], legs: attributes[:legs], arms: attributes[:arms])
    .randomize
    .build
end

weapons = Weapon.create [
  { name: 'Scratch', arms: 0, legs: 2, focus: 11, power: 24 },
  { name: 'Excalibur', arms: 2, legs: 0, focus: 15, power: 28 },
  { name: 'Wouf', arms: 0, legs: 4, focus: 2, power: 11 },
  { name: 'Rocket', arms: 2, legs: 2, focus: 25, power: 34 },
  { name: 'Dig', arms: 0, legs: 0, focus: 20, power: 31 }
]

characters.each_with_index do |character, i|
  character.save
  character.weapons << weapons[i]
end
