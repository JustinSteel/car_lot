Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"
  get "/makes", to: "makes#index", as: "makes"
  get "/makes/new", to: "makes#new"
  post "/makes", to: "makes#create"
  get "/makes/:id", to: "makes#show"
  get "/cars", to: "cars#index", as: "cars"
  get "/cars/:id", to: "cars#show"
  get "/makes/:make_id/cars", to: "make_cars#index", as: "make_cars"
 
end
