class CreateFights < ActiveRecord::Migration[7.1]
  def change
    create_table :fights do |t|
      t.string :winner
      t.references :player, foreign_key: { to_table: :characters }
      t.references :opponent, foreign_key: { to_table: :characters }
      t.timestamps
    end
  end
end
