Rails.application.routes.draw do
  root 'branches#index'

  resources :branches, except: :destroy
  resources :employees, :manufacturers, :models, :colors, :memories, :statuses, :products 
  devise_for :users
  
end
