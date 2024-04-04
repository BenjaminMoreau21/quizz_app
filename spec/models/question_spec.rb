require 'rails_helper'

RSpec.describe Question, type: :model do
  before(:each) do
    @user = User.create!(email: "john@example.com", password: "password")
    @theme = Theme.create!(name: "animal", user: @user)
  end

  describe "validations" do
    it "should belong to a theme" do
      question = Question.new(content: "test")
      expect(question).not_to be_valid
      expect(question.errors[:theme]).to include("must exist")
    end

    it "should have a content" do
      question = Question.new(theme: @theme)
      expect(question).not_to be_valid
      expect(question.errors[:content]).to include("can't be blank")
    end

    it 'should valid with a content' do
      question = Question.new(theme: @theme, content: "test")
      expect(question).to be_valid
    end

    it 'should have many options' do
      question = Question.new(theme: @theme, content: "test")
      question.options.empty?
    end
  end
end
