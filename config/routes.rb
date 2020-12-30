Rails.application.routes.draw do
  root 'branches#index'

  resources :branches
  resources :employees
  devise_for :users
  
end
