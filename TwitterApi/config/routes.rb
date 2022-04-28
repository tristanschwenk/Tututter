Rails.application.routes.draw do
  
  scope :api, defaults: {format: :json} do
    resources :likes
    resources :examples
    resources :tweets
    devise_for :users, controllers: {sessions: 'sessions', registrations: 'users/registrations'}
    get '/member-data', to: 'members#show'
    devise_scope :user do
      get 'users/current', to: 'sessions#show'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
