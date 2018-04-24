Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/auth/github/callback", to: 'sessions#create'

  root 'months#index'
  resources :users, only: [:new, :create]
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  resources :runs

  resources :months do
    resources :runs
  end

  get "/fastest_pace", to: "runs#fastest_pace", as: "runs/fastest_pace"
  # get "/my_fastest_runs", to: "user#fastest_runs", as: "user/fastest_runs"

end
