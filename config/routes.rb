Rosap::Application.routes.draw do
  
  root to: 'static_pages#home'
  match "/post_story/auth", to: "post_story#auth", as: :fb_auth, via: :post
  match "/post_story/callback", to: "post_story#callback", as: :fb_callback , via: :get

  devise_for :github_users
end
