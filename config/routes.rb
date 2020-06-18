Rails.application.routes.draw do
  
  devise_for :users
  root to: "tasks#index"

  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :relationships, only: [:index, :create, :destroy]
    member do
      get :praises_index, :follow_index, :follower_index
    end
  end

  resources :tasks, except: [:new, :edit] do
    member do
      get :praised_users_index
    end
    resources :comments, only: [:create]
    resources :praises, only: [:create, :destroy]
  end

  resources :routines, only: [:create, :update, :destroy]
  resources :notifications, only: :index
  get "/tasks/category/:id", to: "tasks#category_index"
end