# == Schema Information
#
# Table name: organizers
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string
#  phone      :string
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Organizer < ApplicationRecord
  has_many :organizer_games, dependent: :destroy
  has_many :games, through: :organizer_games, source: :game
  has_many :reservations, through: :games
  has_many :peers, through: :reservations, source: :profile

  validates :name, :email, :phone, presence: true

  alias events games
end
