Rails.application.routes.draw do
  resources :foodtypes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'foodtypes#index'
end
