Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "questions#index"
  resources :rooms, only: [:index, :new, :create]
  resources :questions, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :advices, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :unresolveds, only: :index
end
