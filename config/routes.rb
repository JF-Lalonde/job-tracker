Rails.application.routes.draw do

  resources :companies do
    resources :jobs do
      resources :comments
    end
  end

  resources :jobs do
    resources :comments
  end

  resources :categories
end
