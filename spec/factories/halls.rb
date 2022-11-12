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
FactoryBot.define do
  factory :hall do
    name { 'MyString' }
    address { 'MyString' }
    capacity { 1 }
  end
end
