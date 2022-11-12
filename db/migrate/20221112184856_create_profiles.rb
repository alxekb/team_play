class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :player, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true
      t.string :nickname
      t.string :avatar
      t.integer :level
      t.integer :rank
      t.integer :score

      t.timestamps
    end
  end
end
