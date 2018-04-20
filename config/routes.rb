Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'months#index'
  resources :runs

  resources :months do
    resources :runs, except: :index
  end

end
