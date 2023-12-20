Rails.application.routes.draw do
  get "/stories" => "stories#index"
  get "/stories/:id" => "stories#show"
  post "/stories/" => "stories#create"
  patch "/stories/:id" => "stories#update"
  delete "/stories/:id" => "stories#destroy"
end
