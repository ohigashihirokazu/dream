Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :dreams
  resources :users, only: [:show, :index, :edit, :update, :destroy]

  resources :dreams, only: [:new, :create, :index, :show] do
  	 resource :favorites, only: [:create, :destroy]
  	resource :dream_comments, only: [:create, :destroy]
end
	resources :relationships, only: [:create, :destroy]

	resources :users do
    member do
     get :following, :followers
    end
  end
end
