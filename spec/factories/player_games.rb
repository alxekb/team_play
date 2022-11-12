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
FactoryBot.define do
  factory :player_games, class: PlayerGame.name do
    game
    profile
  end
end
