Rails.application.routes.draw do
  devise_for :users
  root to: "welcome#home"
  resources :users
  resources :tasks
end
