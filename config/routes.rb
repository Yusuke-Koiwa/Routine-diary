Rails.application.routes.draw do
  devise_for :users
  root to: "welcome#home"
  resources :users do
    resources :relationships, only: [:index, :create, :destroy]
    member do
      get :praises_index, :follow_index, :follower_index
    end
  end
  resources :routines, except: [:index, :show]
  resources :tasks, except: [:edit]
  post "praises/:task_id/create" => "praises#create"
  post "praises/:task_id/destroy" => "praises#destroy"
end