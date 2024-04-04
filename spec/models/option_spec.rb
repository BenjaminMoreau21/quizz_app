require 'rails_helper'

RSpec.describe Option, type: :model do
  before(:each) do
    @user = User.create!(email: "john@example.com", password: "password")
    @theme = Theme.create!(name: "animal", user: @user)
    @question = Question.new(theme: @theme, content: "test")
  end

  describe "validations" do
    it "should belong to a question" do
      option = Option.new(content: "test")
      expect(option).not_to be_valid
      expect(option.errors[:question]).to include("must exist")
    end

    it "should have a content" do
      option = Option.new(question: @question)
      expect(option).not_to be_valid
      expect(option.errors[:content]).to include("can't be blank")
    end

    it 'should valid with a content' do
      option = Option.new(question: @question, content: "test")
      expect(option).to be_valid
    end
  end
end
