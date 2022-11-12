# == Schema Information
#
# Table name: halls
#
#  id         :bigint           not null, primary key
#  address    :string
#  capacity   :integer
#  name       :string
#  phone      :string
#  email      :string
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Hall < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :reservations, through: :games, source: :reservations
  has_many :players, through: :reservations, source: :profile

  validates :name, :address, :capacity, presence: true
end
