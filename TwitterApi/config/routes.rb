Rails.application.routes.draw do
  devise_for :registrations
  
  scope :api, defaults: {format: :json} do
      resources :examples
      resources :likes
      resources :follows
      resources :tweets
      devise_for :users, controllers: {sessions: 'sessions', registrations: 'users/registrations'}

    devise_scope :user do
      get 'users/current', to: 'sessions#show'
      get 'users', to: 'user#index'
      get 'users/:id', to: 'user#show'
      
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
