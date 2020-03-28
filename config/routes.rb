Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    resources :clients, except: [:new, :edit] do
      resources :taxes
      resources :benefits
    end
  end

  root to: 'app/application#index'
  get '/app/(*vue)', to: 'app/application#index', as: :vue_app
end
