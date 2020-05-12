Rails.application.routes.draw do
  devise_for :users
  root to: "welcome#home"
  resources :users do
    resources :relationships, only: [:index, :create, :destroy]
    member do
      get :praises_index, :follow_index, :follower_index
    end
  end
  resources :tasks, except: [:edit] do
    resources :praises, only: [:create, :destroy]
  end
  resources :routines, except: [:index, :show]
end