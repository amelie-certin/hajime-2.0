class CreateWeapons < ActiveRecord::Migration[7.1]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :arms, default: 0
      t.integer :legs, default: 0
      t.integer :focus, default: 0
      t.integer :power, default: 0
      t.timestamps
    end
  end
end