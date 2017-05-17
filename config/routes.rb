Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user_registrations" }
  resources :users
  resources :products do
    resources :comments
  end
  


  get 'static_pages/about'

  get 'static_pages/contact'

  get '/static_pages/index'

  get '/static_pages/landing_page'

  get '/static_pages/login'

  post '/static_pages/thank_you'

  post '/payments/create'
  
  root 'static_pages#landing_page'

  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
