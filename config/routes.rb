Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show] do
        resources :subscriptions, only: [:index, :create, :update] do
          member do
            patch "cancel"
          end
        end
      end
    end
  end
end
