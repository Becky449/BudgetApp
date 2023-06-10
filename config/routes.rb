Rails.application.routes.draw do
  devise_for :users
  root 'splash_screen#index'
  resources :categories, only: [:index, :new, :create, :show, :destroy] do
    resources :expenditures, only: [:index, :new, :create, :show, :destroy]
  end
end
