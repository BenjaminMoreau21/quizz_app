require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "validations" do
    it "should belong to a theme" do
      question = Question.new(content: "tetst")
      expect(question).not_to be_valid
      expect(question.errors[:theme]).to include("must exist")
    end

    it "should have a content" do
      user = User.create!(email: "john@example.com", password: "password")
      theme = Theme.new(name: "animal", user: user)
      question = Question.new(theme: theme)
      expect(question).not_to be_valid
      expect(question.errors[:content]).to include("can't be blank")
    end

    it 'should valid with a content' do
      user = User.create!(email: "john@example.com", password: "password")
      theme = Theme.new(name: "animal", user: user)
      question = Question.new(theme: theme, content: "test")
      expect(question).to be_valid
    end
  end
end
