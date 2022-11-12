# == Schema Information
#
# Table name: organizer_games
#
#  id           :bigint           not null, primary key
#  game_id      :bigint           not null
#  organizer_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class OrganizerGame < ApplicationRecord
  belongs_to :game
  belongs_to :organizer

  validates :game, :organizer, presence: true
end
