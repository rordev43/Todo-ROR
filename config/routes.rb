Rails.application.routes.draw do
  devise_for :users

  resources :tasks do
    patch :complete, on: :member
    patch :uncomplete, on: :member
    get :search, on: :collection
  end

  root "tasks#index"
end
