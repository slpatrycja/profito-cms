Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    resources :clients, except: [:new, :edit]

    namespace :clients, path: '/clients/:client_id' do
      resources :taxes
      resources :benefits
      resources :global_services
    end
  end

  get '/app/(*vue)', to: 'app/application#index', as: :vue_app
  root to: 'app/application#index'
end
