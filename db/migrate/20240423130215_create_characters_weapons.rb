class CreateCharactersWeapons < ActiveRecord::Migration[7.1]
  def change
    create_table :characters_weapons do |t|
      t.references :weapon
      t.references :character
      t.timestamps
    end
  end
end
