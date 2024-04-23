class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :arms, default: 0
      t.integer :legs, default: 0
      t.integer :strength, default: 0
      t.integer :defense, default: 0
      t.integer :health, default: 0
      t.integer :focus, default: 0
      t.integer :speed, default: 0
      t.integer :charisma, default: 0
      t.timestamps
    end
  end
end
