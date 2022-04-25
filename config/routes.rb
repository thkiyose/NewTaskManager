Rails.application.routes.draw do
  get 'tasks/index'
  resources :users, only: [:new,:create,:show]
  resources :sessions, only:[:new,:create,:destroy]
  resources :tasks
  root to: "sessions#new"
end
