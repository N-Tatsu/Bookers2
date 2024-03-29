Rails.application.routes.draw do

  devise_for :users
  root to:'homes#top'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :books, only: [:index, :show, :edit, :update, :create, :destroy]

  get 'home/about', to:'homes#about',as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
