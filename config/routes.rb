Rails.application.routes.draw do
  root 'pages#home'
  get 'watchlists', to: 'watchlists#index'

  resources :tasks
  resources :profiles

  patch 'tasks/:id/accept',   to: 'tasks#accept',   as: 'accept_task'
  patch 'tasks/:id/assign',   to: 'tasks#assign',   as: 'assign_task'
  patch 'tasks/:id/paid',     to: 'tasks#paid',     as: 'paid_task'
  patch 'tasks/:id/complete', to: 'tasks#complete', as: 'complete_task'

  post   'watchlists/:id',       to: 'watchlists#add',    as: 'add_watchlist'
  delete 'watchlists/:id/:from', to: 'watchlists#delete', as: 'delete_watchlist'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
