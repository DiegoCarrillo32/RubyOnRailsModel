Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  root 'users#index'
  # get '/age', to: 'users#getAge', as: 'age'
  # get '/active', to: 'users#toggleActive', as: 'active'
end
