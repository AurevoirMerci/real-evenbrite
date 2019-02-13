Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :users
  resources :events do 
  resources :participations
end 
  resources :events do 
  resources :charges
end 
end
