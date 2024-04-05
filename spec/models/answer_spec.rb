require 'rails_helper'

RSpec.describe Answer, type: :model do
  before(:each) do
    @user = User.create!(email: "john@example.com", password: "password")
    @theme = Theme.create!(name: "animal", user: @user)
    @question = Question.create!(theme: @theme, content: "test")
    @result = Result.create!(user: @user, theme: @theme)
    @option = Option.create!(question: @question, content: "test")
  end

  it "should belong to a user" do
    answer = Answer.new(option: @option, result: @result)
    expect(answer).not_to be_valid
    expect(answer.errors[:user]).to include("must exist")
  end

  it "should belong to an option" do
    answer = Answer.new(user: @user, result: @result)
    expect(answer).not_to be_valid
    expect(answer.errors[:option]).to include("must exist")
  end

  it "should belong to a result" do
    answer = Answer.new(user: @user, option: @option)
    expect(answer).not_to be_valid
    expect(answer.errors[:result]).to include("must exist")
  end
end
