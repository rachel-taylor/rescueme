Rails.application.routes.draw do
  resources :notes
  root 'posts#index'

  get 'about', to: 'posts#about'
end
