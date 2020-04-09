Rails.application.routes.draw do
  get 'home/top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dreams
  resources :users, only: [:show, :index, :edit, :update, :destroy]
end
