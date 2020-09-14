Rails.application.routes.draw do
  resources :notes

  root 'application#index'
 
end
