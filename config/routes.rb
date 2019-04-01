Rails.application.routes.draw do
  resources :bids
  resources :auctions
  root to: "pages#home"
  resources :users, only: [:new, :create, :update, :edit]

  resource :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  namespace :api, defaults: { format: :json } do
    # /api...
    namespace :v1 do
      # /api/v1...
      resources :auctions
      # /api/v1/questions...
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
