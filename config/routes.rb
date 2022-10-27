Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  # authenticated :user do
  #   root 'groups#index', as: :authenticated_root
  # end

  # unauthenticated :user do
  #   root to: 'users#index'
  # end
  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :users, only: [:index]
  resources :groups, only: %i[index show new create destroy] do
    resources :expenses, only: %i[index show new create destroy]
  end
end
