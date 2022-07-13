Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :users, only: [:show] 

  get "/users/:user_id/items", to: "items#user_items"
  get "/users/:user_id/items/:id", to: "items#user_items_id"
  post "/users/:user_id/items", to: "items#add_item"
end
