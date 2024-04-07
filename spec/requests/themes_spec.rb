require 'rails_helper'

RSpec.describe "Themes", type: :request do
  describe "GET /" do
    it "should render the index page" do
      get root_path
      expect(response).to render_template :index
    end
  end

  describe "GET /New" do
    it "should render the new page" do
      @user = User.create!(email: "john@example.com", password: "password")
      sign_in @user
      get new_theme_path
      expect(response).to render_template :new
    end
  end


end
