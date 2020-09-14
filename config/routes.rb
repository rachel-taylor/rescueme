Rails.application.routes.draw do
  
  devise_for :users
  resources :notes
 

  root 'application#index'

  get 'signup', to: 'users#new'
 
end
