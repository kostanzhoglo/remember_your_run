Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'months#index'
  resources :users, only: [:new, :create]
  resources :runs

  resources :months do
    resources :runs
  end

end
