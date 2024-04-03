require 'rails_helper'

RSpec.describe Theme, type: :model do
  describe 'validations' do
    it 'should belongs to a user' do
      theme = Theme.new(name: "animal")
      expect(theme).not_to be_valid
      expect(theme.errors[:user]).to include("must exist")
    end

    it 'is not valid without a name' do
      user = User.create!(email: "john@example.com", password: "password")
      theme = Theme.new(user: user)
      expect(theme).not_to be_valid
      expect(theme.errors[:name]).to include("can't be blank")
    end

    it 'is valid with a name' do
      user = User.create!(email: "john@example.com", password: "password")
      theme = Theme.new(name: "Test name", user: user)
      expect(theme).to be_valid
    end
  end
end
