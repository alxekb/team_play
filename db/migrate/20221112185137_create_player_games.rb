class CreatePlayerGames < ActiveRecord::Migration[7.0]
  def change
    create_table :player_games do |t|
      t.references :game, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
