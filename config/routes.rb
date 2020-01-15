Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:show, :index, :new, :create]

  #destination routes
  get '/destinations', to: "destinations#index", as: "destinations"
  get '/destinations/:id', to: "destinations#show", as: "destination"

  #post routes
  get '/posts', to: "posts#index", as: "posts"
  get '/posts/new', to: "posts#new", as: "new_post"
  get '/posts/:id', to: "posts#show", as: "post"
  get '/posts/:id/edit', to: "posts#edit", as: "edit_post"
  post '/posts', to: "posts#create"
  patch '/posts/:id', to: "posts#update"
  patch '/posts/:id/like', to: "posts#like", as: "like_post"

  #greeting route
  get "/", to: "greetings#greeting"
  get "/analytics", to: "greetings#analytics"

   
end
