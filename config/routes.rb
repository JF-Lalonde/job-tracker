Rails.application.routes.draw do
  root to: "sessions#new"
  resources :companies do
    resources :jobs do
      resources :comments
    end
  end

  resources :jobs do
    resources :comments, only: :create
  end

  resources :categories

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
