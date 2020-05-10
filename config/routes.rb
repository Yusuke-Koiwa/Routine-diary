Rails.application.routes.draw do
  devise_for :users
  root to: "welcome#home"
  resources :users
  resources :routines, except: [:index, :show]
  resources :tasks, except: [:edit]
  post "praises/:task_id/create" => "praises#create"
  post "praises/:task_id/destroy" => "praises#destroy"
end