Rails.application.routes.draw do
  root 'branches#index'

  resources :branches, except: :destroy
  resources :manufacturers, except: %i[destroy show]
  resources :colors, except: %i[destroy show]
  resources :memories, except: %i[destroy show]
  resources :statuses, except: %i[destroy show]
  resources :employees
  resources :models
  resources :products

  devise_for :users
end
