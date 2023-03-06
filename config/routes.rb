Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index]
      resources :learning_resources, only: [:index]
      
      post '/register', to: 'users#create'
      get '/dashboard', to: 'users#show'
      post '/favorites', to: 'favorites#create'
      get '/favorites', to: 'favorites#index'
      get '/tourist_sights', to: 'tourist_sights#index'
    end
  end
end
