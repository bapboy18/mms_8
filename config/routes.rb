Rails.application.routes.draw do
  require "sidekiq/web"
  devise_for :users
  root "static_pages#home"
  get "static_pages/help"
  get "static_pages/about"

  namespace :admin do
    root "users#index"
    get "team_users/new"
    resources :users do
      resource :position_users, only: :show
      get "positions" => "position_users#show"
    end
    resources :teams do
      resource :team_users, only: :show
      get "members" => "team_users#show"
    end
    resources :skills
    resources :projects
    resources :positions
  end
  resources :teams

  mount Sidekiq::Web, at: "/sidekiq"
end
