class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :hall, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :limit

      t.timestamps
    end
  end
end
