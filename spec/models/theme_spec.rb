require 'rails_helper'

RSpec.describe Theme, type: :model do
  before(:each) do
    @user = User.create!(email: "john@example.com", password: "password")
  end

  describe 'validations' do
    it 'should belongs to a user' do
      theme = Theme.new(name: "animal")
      expect(theme).not_to be_valid
      expect(theme.errors[:user]).to include("must exist")
    end

    it 'is not valid without a name' do
      theme = Theme.new(user: @user)
      expect(theme).not_to be_valid
      expect(theme.errors[:name]).to include("can't be blank")
    end

    it 'is valid with a name' do
      theme = Theme.new(name: "Test name", user: @user)
      expect(theme).to be_valid
    end

    it 'should have many questions' do
      theme = Theme.new(name: "Test name", user: @user)
      expect(theme.questions).to be_empty
    end
  end
end
