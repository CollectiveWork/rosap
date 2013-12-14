Rosap::Application.routes.draw do
  
  root to: 'static_pages#home'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  match 'post_story', to: 'post_story#postme', via: [:get,:post]

  devise_for :github_users
end
