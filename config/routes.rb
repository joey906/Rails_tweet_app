Rails.application.routes.draw do
  
  get "posts/:user_id/new" => "posts#new"
  get "posts/top" => "posts#top"
  post "posts/top" => "posts#topmod"
  post "posts/:id/destroy" => "posts#destroy"

  get "user/all" => "user#all"
  post "user/login" => "user#login"
  get "user/login_form" => "user#login_form"
  get "/create_form" => "user#create_form"
  post "user/create" => "user#create"
  get "user/test" => "user#test"
  post "user/logout" => "user#logout"

  get "user/:id" => "user#top"
  get "user/:id/edit" => "user#edit"
  post "user/:id/update" => "user#update"
  

  get "/" => "home#top"
  get "/about" => "home#about"

  get "friends/all" => "frinds#all"
  post "friends/:friend_id/create" => "frinds#create"
  post "friends/:friend_id/chat_deco" => "frinds#chat_deco"
  get "friends/friended_by" => "frinds#friended_by"
  get "friends/friended" => "frinds#friended"
  get "friends/:friend_id" => "frinds#pre_chat"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
