Rails.application.routes.draw do
  
  resources :user
  resources :notes do
    resources :comments
  end 
  

  root 'application#index'
  
  devise_for :users, :controllers => { users: 'registrations', users: 'sessions/sessions' }

  
    
end
