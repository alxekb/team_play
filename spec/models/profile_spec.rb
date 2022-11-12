# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  player_id  :bigint           not null
#  sport_id   :bigint           not null
#  nickname   :string
#  avatar     :string
#  level      :integer
#  rank       :integer
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Profile, type: :model do # rubocop:disable Metrics/BlockLength
  describe 'validations' do
    it { should validate_presence_of(:player) }
    it { should validate_presence_of(:sport) }
  end

  describe 'associations' do
    it { should belong_to(:player) }
    it { should belong_to(:sport) }
    it { should have_many(:games) }
  end

  describe 'validations' do
    it { should validate_presence_of(:player) }
    it { should validate_presence_of(:sport) }
    it { should validate_presence_of(:nickname) }
    it { should validate_presence_of(:level) }
    it { should validate_presence_of(:rank) }
    it { should validate_presence_of(:score) }
  end

  describe 'associations' do
    it { should belong_to(:player) }
    it { should belong_to(:sport) }
    it { should have_many(:player_games) }
    it { should have_many(:games) }
    it { should have_many(:halls) }
    it { should have_many(:organizers) }
  end

  describe 'scopes' do
    describe 'by_sport' do
      let(:sport) { create(:sport) }
      let(:player) { create(:player) }
      let!(:profile) { create(:profile, sport:, player:) }

      it 'returns the profile by sport' do
        expect(Profile.by_sport(sport.id)).to eq([profile])
      end
    end

    describe 'by_hall' do
      let(:sport) { create(:sport) }
      let(:player) { create(:player) }
      let(:hall) { create(:hall) }
      let(:profile) { create(:profile, sport:, player:) }
      let(:game) { create(:game, hall:, sport:) }
      let!(:reservation) { create(:player_games, game:, profile:) }

      it 'returns the profile by hall' do
        expect(Profile.by_hall(hall.id)).to eq([profile])
      end
    end

    describe 'by_organizer' do
      let(:sport) { create(:sport) }
      let(:player) { create(:player) }
      let(:hall) { create(:hall) }
      let(:profile) { create(:profile, sport:, player:) }
      let(:game) { create(:game, hall:, sport:) }
      let(:organizer) { create(:organizer) }
      let!(:organizer_game) { create(:organizer_games, organizer:, game:) }
      let!(:reservation) { create(:player_games, game:, profile:) }
      let!(:org_reservation) { create(:organizer_games, organizer:, game:) }

      it 'returns the profile by organizer' do
        expect(Profile.by_organizer(organizer.id).pluck(:id)).to eq([profile.id])
      end
    end

    describe 'by_player' do
      let(:sport) { create(:sport) }
      let(:player) { create(:player) }
      let!(:profile) { create(:profile, sport:, player:) }

      it 'returns the profile by player' do
        expect(Profile.by_player(player.id)).to eq([profile])
      end
    end

    describe 'by_player_and_sport' do
      let(:sport) { create(:sport) }
      let(:player) { create(:player) }
      let!(:profile) { create(:profile, sport:, player:) }
      let!(:other_sport) { create(:sport, name: 'Volleyball') }
      let!(:other_profile) { create(:profile, nickname: 'Bogus', sport: other_sport, player:) }

      it 'returns the profile by player and sport' do
        expect(Profile.by_player_and_sport(player.id, sport.id)).to eq([profile])
      end
    end
  end
end
