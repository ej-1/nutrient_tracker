Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :eaten_foods, only: [:index, :create, :destroy, :update]
    end
  end

  resources :eaten_foods
  resources :foodtypes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'foodtypes#index'
  root to: 'site#index'
end
