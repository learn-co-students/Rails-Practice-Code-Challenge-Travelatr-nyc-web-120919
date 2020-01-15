Rails.application.routes.draw do
  get '/bloggers/new', to: "bloggers#new", as: "new_blogger"
  get '/destinations/new', to: "destinations#new", as: "new_destination"
  get '/posts/new', to: "posts#new", as: "new_post"
  get '/bloggers/:id', to: "bloggers#show", as: "blogger"
  get '/posts/:id', to: "posts#show", as: "post"
  get '/destinations/:id', to: "destinations#show", as: "destination"
  get '/bloggers', to: "bloggers#index", as: "bloggers" 
  get '/posts', to: "posts#index", as: "posts"
  get '/', to: "bloggers#index"
  get '/destinations', to: "destinations#index", as: "destinations"
  post '/posts', to: "posts#create"
  post '/bloggers', to: "bloggers#create"
  get '/posts/:id/edit', to: "posts#edit", as: "edit_post"
  patch '/posts/:id', to: "posts#update"

end
