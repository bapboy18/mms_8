Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get 'static_pages/help'
  get 'static_pages/about'

  resource :users, only: [:index, :show]
end
