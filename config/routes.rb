Rosap::Application.routes.draw do

  devise_for :github_users

    root  to: 'users_github#login', via: :get
    match '/github/login', to: 'users_github#login', via: :get
    match '/github/login', to: 'users_github#make_login', via: :post
    match '/about', to:'static_pages#about', via: :get
    match '/contact', to: 'static_pages#contact', via: :get
    match '/logout', to: 'users_github#destroy', via: :delete

    resource :users_github, controller: :users_github
    resource :projects do
      collection do
        match '/all', to: 'projects#all_projects', via: :get
      end
    end

  match "/post_story/auth", to: "post_story#auth", as: :fb_auth, via: :post
  match "/post_story/callback", to: "post_story#callback", as: :fb_callback , via: :get

end
