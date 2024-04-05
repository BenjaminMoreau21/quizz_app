require 'rails_helper'

RSpec.describe Result, type: :model do
  before(:each) do
    @user = User.create!(email: "john@example.com", password: "password")
    @theme = Theme.create!(name: "animal", user: @user)
  end

  it "should belong to a user" do
    result = Result.new(theme: @theme)
    expect(result).not_to be_valid
    expect(result.errors[:user]).to include("must exist")
  end

  it "should belong to a theme" do
    result = Result.new(user: @user)
    expect(result).not_to be_valid
    expect(result.errors[:theme]).to include("must exist")
  end
end
