Rails.application.routes.draw do
  resources :notes
  resources :user 

  root 'application#index'

  get 'signup', to: 'users#new'
 
end
