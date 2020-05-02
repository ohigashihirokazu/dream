Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'


  # get '/auth/:provider/callback', to: 'sessions#create'
  # get '/logout', to: 'sessions#destroy'


  #get 'users/matching/', to: 'users#matching', param: :id

  resources :users, only: [:show, :index, :edit, :update, :destroy] do
    #get :matching, to: 'users#matching'
   member do
     get :following, :followers
     get :matching
   end
 end

  resources :dreams, only: [:new, :create, :edit, :index, :show, :update] do
    resource :favorites, only: [:create, :destroy]
    resource :dream_comments, only: [:create, :destroy]
    get :search, on: :collection
  end
  resources :relationships, only: [:create, :destroy]

end
