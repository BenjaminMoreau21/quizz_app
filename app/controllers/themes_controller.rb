class ThemesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @themes = Theme.all
  end

  def new
    @theme = Theme.new
  end
end
