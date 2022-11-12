# == Schema Information
#
# Table name: player_games
#
#  id         :bigint           not null, primary key
#  game_id    :bigint           not null
#  profile_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PlayerGame < ApplicationRecord
  belongs_to :game
  belongs_to :profile

  validates :game, :profile, presence: true
end
