Rosap::Application.routes.draw do
  
  resources :static_pages

  devise_for :github_users

  root to: 'static_pages#index'


  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
