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
require 'rails_helper'

RSpec.describe Hall, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:capacity) }
  end

  describe 'associations' do
    it { should have_many(:games) }
    it { should have_many(:reservations) }
    it { should have_many(:players) }
  end
end
