# frozen_string_literal: true

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
require 'rails_helper'

RSpec.describe Organizer, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
  end

  describe 'associations' do
    it { should have_many(:games) }
    it { should have_many(:organizer_games) }
    it { should have_many(:reservations) }
    it { should have_many(:peers) }
  end
end
