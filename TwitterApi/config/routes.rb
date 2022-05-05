Rails.application.routes.draw do
  
  scope :api, defaults: {format: :json} do
      resources :examples
      resources :likes
      resources :follows
      resources :tweets
          get "tweets/by-user/:id", to: "tweets#byUser"
          get "tweets/hashtag/:hashtag", to: "tweets#hashtag"
      devise_for :users, controllers: {sessions: 'sessions'}, skip: :registrations

    devise_scope :user do
      get 'users/current', to: 'sessions#show'
      get 'users', to: 'users#index'
      get 'users/:id', to: 'users#show'
      post 'users/register', to: 'registrations#create'
      
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
