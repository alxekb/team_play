# == Schema Information
#
# Table name: sports
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:games) }
    it { should have_many(:organizers).through(:games) }
    it { should have_many(:players).through(:profiles) }
    it { should have_many(:profiles) }
  end
end
