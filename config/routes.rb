Rails.application.routes.draw do
  root 'pages#home'
  get 'contact', to: 'pages#contact'
  post '/contact', to:'pages#contact_email'
  
  get 'watchlists', to: 'watchlists#index'
  get 'mytasks',    to: 'tasks#list_mytask'
  get 'myposts',    to: 'tasks#list_mypost'

  resources :profiles
  resources :tasks do
    member do
      # /tasks/1/charge 
      post 'charge'
    end
  end
  
  patch 'tasks/:id/accept',   to: 'tasks#accept',   as: 'accept_task'
  patch 'tasks/:id/assign',   to: 'tasks#assign',   as: 'assign_task'
  patch 'tasks/:id/complete', to: 'tasks#complete', as: 'complete_task'

  post   'watchlists/:id',       to: 'watchlists#add',    as: 'add_watchlist'
  delete 'watchlists/:id/:from', to: 'watchlists#delete', as: 'delete_watchlist'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
