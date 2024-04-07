require 'rails_helper'

RSpec.describe "Themes", type: :request do
  before(:each) do
    @user = User.create!(email: "john@example.com", password: "password")
    sign_in @user
  end
  describe "GET /" do
    it "should render the index page" do
      get root_path
      expect(response).to render_template :index
    end
  end

  describe "GET /New" do
    it "should render the new page" do
      get new_theme_path
      expect(response).to render_template :new
    end
  end

  describe "Post /Theme" do
    context "with valid parametes" do
      it "should create a theme" do
        expect { post themes_path, params: { theme: { name: "Animal" } } }.to change(Theme, :count).by(1)
      end
      it "creates a theme with the correct attributes" do
        post themes_path, params: { theme: { name: "Animal" } }
        theme = Theme.last
        expect(theme.name).to eq("Animal")
      end
      it "should redirect to the theme's page" do
        post themes_path, params: { theme: { name: "Animal" } }
        expect(response).to redirect_to(Theme.last)
      end
    end
    context "with invalid parameters" do
      it "should not create a theme" do
        expect { post themes_path, params: { theme: { name: nil } } }.not_to change(Theme, :count)
      end
      it "should render the 'new' template" do
        post themes_path, params: { theme: { name: nil } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe " Delete /Theme" do
    it "should destroy a theme" do
      theme = Theme.create!(name: "Animal", user: @user)
      expect { delete theme_path(theme) }.to change(Theme, :count).by(-1)
    end
  end
end
