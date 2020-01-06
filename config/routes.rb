Rails.application.routes.draw do
  
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do

    namespace :v1 do

      resources :accounts, only: [:index, :create]  do

        resources :balance, only: [:index] 

        resources :deposits, only: [:index, :create] 

        resources :transfers, only: [:index, :create] 

      end

    end

  end

end
