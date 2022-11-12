# frozen_string_literal: true

# == Schema Information
#
# Table name: organizer_games
#
#  id           :bigint           not null, primary key
#  game_id      :bigint           not null
#  organizer_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe OrganizerGame, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:game) }
    it { should validate_presence_of(:organizer) }
  end

  describe 'associations' do
    it { should belong_to(:game) }
    it { should belong_to(:organizer) }
  end
end
