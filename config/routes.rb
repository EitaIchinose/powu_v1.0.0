Rails.application.routes.draw do
  devise_for :users
  root to: "departments#index"
  resources :users,  only: [:edit, :update]
  resources :departments, only: [:new, :create, :destroy] do
    resources :events
    resources :comments, only: [:create, :update, :destroy]
  end
end
