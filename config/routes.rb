Rails.application.routes.draw do
  devise_for :users
  root to: "tasks#index"

  resources :users, only: %i[show edit update destroy] do
    resources :relationships, only: %i[index create destroy]
    member do
      get :praises_index, :follow_index, :follower_index
    end
  end

  resources :tasks, except: %i[new edit] do
    member do
      get :praised_users_index
    end
    resources :comments, only: [:create]
    resources :praises, only: %i[create destroy]
  end

  resources :routines, only: %i[create update destroy]
  resources :notifications, only: :index
  get "/tasks/category/:id", to: "tasks#category_index"
end
