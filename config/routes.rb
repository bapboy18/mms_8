Rails.application.routes.draw do
  root 'users#index'
  get 'static_pages/help'
  get 'static_pages/about'

  devise_for :users
  resource :users
end
