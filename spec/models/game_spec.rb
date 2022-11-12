# == Schema Information
#
# Table name: games
#
#  id         :bigint           not null, primary key
#  hall_id    :bigint           not null
#  sport_id   :bigint           not null
#  started_at :datetime
#  ended_at   :datetime
#  limit      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'validations' do
      it { should validate_presence_of(:hall) }
      it { should validate_presence_of(:sport) }
      it { should validate_presence_of(:started_at) }
      it { should validate_presence_of(:ended_at) }
      it { should validate_presence_of(:limit) }
  end
  describe 'associations' do
    it { should belong_to(:hall) }
    it { should belong_to(:sport) }
    it { should have_many(:reservations) }
    it { should have_many(:players) }
    it { should have_many(:organizer_games) }
    it { should have_many(:organizers) }
  end
end
