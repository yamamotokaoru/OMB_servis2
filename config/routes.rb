Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
  get 'home/about'
  resources :blogs ,only: [:index, :new, :create, :show, :destroy, :edit, :update]
  resources :users, only: [:show]
end
