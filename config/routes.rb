Rails.application.routes.draw do
  get "/stories" => "stories#index"
  get "/stories/current_stories" => "stories#current_stories"
  get "/stories/:id" => "stories#show"
  post "/stories" => "stories#create"
  patch "/stories/:id" => "stories#update"
  delete "/stories/:id" => "stories#destroy"

  post "/users" => "users#create"
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  post "/sessions" => "sessions#create"

  get "/comments" => "comments#index"
  get "/comments/:id" => "comments#show"
  patch "/comments/:id" => "comments#update"
  post "/comments" => "comments#create"
  delete "/comments/:id" => "comments#destroy"
end
