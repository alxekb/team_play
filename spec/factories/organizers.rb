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
FactoryBot.define do
  factory :organizer do
    name { 'MyString' }
    email { 'MyString' }
    phone { 'MyString' }
    website { 'MyString' }
  end
end
