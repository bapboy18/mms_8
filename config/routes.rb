Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  get "static_pages/help"
  get "static_pages/about"

  namespace :admin do    
    root "users#index"
    resources :users
    resources :teams
  end
end
