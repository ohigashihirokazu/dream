Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :dreams

  get 'users/matching', to: 'users#matching'

  resources :users, only: [:show, :index, :edit, :update, :destroy]
  
  resources :dreams, only: [:new, :create, :index, :show] do
    resource :favorites, only: [:create, :destroy]
    resource :dream_comments, only: [:create, :destroy]
    get :search, on: :collection
  end
  resources :relationships, only: [:create, :destroy]

  constraints(id: /\d+/) do
   resources :users do
    member do
     get :following, :followers
   end
   collection do
    get :matching
    end
   end
  end
end
