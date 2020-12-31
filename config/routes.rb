Rails.application.routes.draw do
  root 'branches#index'

  resources :branches, except: :destroy
  resources :manufacturers, :colors, :memories, :statuses, except: [:destroy, :show]
  resources :employees, :models, :products
  devise_for :users
  
end
