# == Schema Information
#
# Table name: sports
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Sport < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :profiles, dependent: :destroy
  has_many :organizers, through: :games
  has_many :players, through: :profiles

  validates :name, presence: true
end
