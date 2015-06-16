Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  get "static_pages/help"
  get "static_pages/about"

  namespace :admin do    
    root "users#index"
    resources :users do
      resource :position_users, only: :show
      get "positions" => "position_users#show"
    end
    resources :teams
    resources :skills
    resources :projects
    resources :positions
  end
end
