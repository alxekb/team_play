class CreateOrganizerGames < ActiveRecord::Migration[7.0]
  def change
    create_table :organizer_games do |t|
      t.references :game, null: false, foreign_key: true
      t.references :organizer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
