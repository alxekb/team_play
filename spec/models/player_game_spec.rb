# == Schema Information
#
# Table name: player_games
#
#  id         :bigint           not null, primary key
#  game_id    :bigint           not null
#  profile_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe PlayerGame, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:game) }
    it { should validate_presence_of(:profile) }
  end

  describe 'associations' do
    it { should belong_to(:game) }
    it { should belong_to(:profile) }
  end
end
