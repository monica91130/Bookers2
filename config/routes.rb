Rails.application.routes.draw do

  devise_for :users
  resources :books
  resources :users
  root 'root#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
