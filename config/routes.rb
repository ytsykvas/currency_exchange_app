Rails.application.routes.draw do
  root 'currency_conversion#index', as: 'home'
  get 'currency_conversion/index'
  get 'currency_conversion/exchange'
  post 'currency_conversion/exchange'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
