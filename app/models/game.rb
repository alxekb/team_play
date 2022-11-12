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
class Game < ApplicationRecord
  belongs_to :hall
  belongs_to :sport

  has_many :reservations, dependent: :destroy, class_name: PlayerGame.name
  has_many :players, through: :reservations, source: :profile

  # game has many organizers: coach, referee, group admin etc.
  has_many :organizer_games, dependent: :destroy
  has_many :organizers, through: :organizer_games

  validates :hall, :sport, :started_at, :ended_at, :limit, presence: true
end
