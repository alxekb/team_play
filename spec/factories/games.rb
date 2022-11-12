# == Schema Information
#
# Table name: games
#
#  id         :bigint           not null, primary key
#  hall_id    :bigint           not null
#  sport_id   :bigint           not null
#  started_at :datetime
#  ended_at   :datetime
#  limit      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :game do
    hall
    sport
    started_at { '2020-10-10 10:10:10' }
    ended_at { '2020-10-10 11:10:10' }
    limit { 14 }
  end
end
