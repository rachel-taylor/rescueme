Rails.application.routes.draw do
  root 'posts#index'

  get 'about', to: 'posts#about'
end
