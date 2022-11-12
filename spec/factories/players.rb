# == Schema Information
#
# Table name: players
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :player do
    email { 'email@example.com' }
  end
end
