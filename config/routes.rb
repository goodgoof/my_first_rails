Rails.application.routes.draw do
  resources :products

  get '/products/:id(.:format)', to: 'products#show'

  get 'static_pages/about'

  get 'static_pages/contact'

  get '/static_pages/index'

  get '/static_pages/login'
  #root 'welcome#index'
  root 'products#index'

  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
