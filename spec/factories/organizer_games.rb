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
FactoryBot.define do
  factory :organizer_games, class: OrganizerGame do
    game
    organizer
  end
end
