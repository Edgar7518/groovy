Rails.application.routes.draw do
  devise_for :users
  resources :exchanges, only: [:create]
  root to: "pages#home"
  resources :vinyls, only: [:index, :show]
  resources :collections, only: [:new, :create, :show, :index] do
    resources :collections_vinyls, only: [:create]
  end

  resources :collections_vinyls, only: [:destroy]
  resources :wishlists, only: [:destroy]
  get "my-exchanges", to: "my_exchanges#index"
  patch "exchanges/:id/status", to: "exchanges#update_status"
  patch "exchanges/:id/offered_vinyl", to: "exchanges#update_offered_vinyl"
end
