# == Schema Information
#
# Table name: players
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
  end

  describe 'associations' do
    it { should have_many(:profiles) }
  end
end
