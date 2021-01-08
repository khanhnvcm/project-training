Rails.application.routes.draw do
  root 'branches#index'

  resources :branches, except: :destroy
  resources :manufacturers, except: [:destroy, :show]
  resources :colors, except: [:destroy, :show]
  resources :memories, except: [:destroy, :show]
  resources :statuses, except: [:destroy, :show]
  resources :employees
  resources :models
  resources :products

  devise_for :users

end
