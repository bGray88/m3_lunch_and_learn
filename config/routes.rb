Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index]
      resources :learning_resources, only: [:index]
      
      post '/register', to: 'users#create'
    end
  end
end
