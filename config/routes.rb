Rails.application.routes.draw do

  resources :reservations
  resources :bookmarks
  resources :restaurants
  resources :users

  root  'main#index'
  get     'login' => 'sessions#new'
  post    'login' => 'sessions#create'
  delete  'logout' => 'sessions#destroy'


end
