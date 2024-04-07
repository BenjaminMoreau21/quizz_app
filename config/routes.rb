Rails.application.routes.draw do
  devise_for :users
  root to: "themes#index"
  resources :themes, except: :index
end
