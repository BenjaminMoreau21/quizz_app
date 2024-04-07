class ThemesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @themes = Theme.all
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
    @theme.user = current_user
    if @theme.save
      redirect_to theme_path(@theme)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    redirect_to root_path
  end

  private

  def theme_params
    params.require(:theme).permit(:name)
  end
end
