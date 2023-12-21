Rails.application.routes.draw do
  get "/stories" => "stories#index"
  get "/stories/:id" => "stories#show"
  post "/stories/" => "stories#create"
  patch "/stories/:id" => "stories#update"
  delete "/stories/:id" => "stories#destroy"

  post "/users" => "users#create"
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"
end
