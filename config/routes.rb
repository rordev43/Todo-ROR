Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :tasks, except: [:index, :show] do
      patch :complete, on: :member
      patch :uncomplete, on: :member
    end
  end

  root to: 'users#show'
end
