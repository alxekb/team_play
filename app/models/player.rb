# == Schema Information
#
# Table name: players
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Player < ApplicationRecord
  has_many :profiles, dependent: :destroy

  validates :email, presence: true
end
