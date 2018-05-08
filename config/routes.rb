Rails.application.routes.draw do
  root 'pages#home'
  resources :tasks
  resources :profiles

  patch 'tasks/:id/accept',   to: 'tasks#accept',   as: 'accept_task'
  patch 'tasks/:id/assign',   to: 'tasks#assign',   as: 'assign_task'
  patch 'tasks/:id/paid',     to: 'tasks#paid',     as: 'paid_task'
  patch 'tasks/:id/complete', to: 'tasks#complete', as: 'complete_task'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
