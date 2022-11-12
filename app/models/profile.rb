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
class Profile < ApplicationRecord
  belongs_to :player
  belongs_to :sport

  has_many :player_games, dependent: :destroy
  has_many :games, through: :player_games, source: :game
  has_many :halls, through: :games, source: :hall
  has_many :organizers, through: :games, source: :organizers

  validates :nickname, :avatar, :level, :rank, :score, presence: true
  validates :player, :sport, presence: true
  validates :nickname, uniqueness: { scope: :player_id }
  validates :level, :rank, :score, numericality: { only_integer: true }
  validates :level, :rank, :score, numericality: { greater_than_or_equal_to: 0 }
  validates :avatar, format: { with: /\.(png|jpg|jpeg)\z/i }, allow_blank: true
  validates :nickname, length: { maximum: 20 }
  validates_uniqueness_of :player_id, scope: :sport_id

  scope :reservations, -> { joins(:games).where('games.started_at > ?', Time.now) }

  scope :by_sport, ->(sport) { where(sport:) }
  scope :by_hall, ->(hall) { joins(:games).where(games: { hall: }) }
  scope :by_player, ->(player) { where(player:) }
  scope :by_player_and_sport, ->(player, sport) { where(player:, sport:) }
  scope :by_organizer, lambda { |organizer|
    joins(games: [:organizer_games])
      .where(games: { organizer_games: { organizer: } })
      .distinct
  }
end
