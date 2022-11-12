# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  player_id  :bigint           not null
#  sport_id   :bigint           not null
#  nickname   :string
#  avatar     :string
#  level      :integer
#  rank       :integer
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :profile do
    nickname { 'John Doe' }
    avatar { 'https://www.gravatar.com/avatar.jpg' }
    level { 1 }
    rank { 1 }
    score { 1 }
    player
    sport
  end
end
