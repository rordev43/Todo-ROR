Rails.application.routes.draw do
  devise_for :users

  resources :tasks do
    member do
      post :toggle
    end
    get '/page/:page', action: :index, on: :collection
  end

  root "tasks#index"
end
