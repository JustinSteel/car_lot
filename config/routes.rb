Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/makes", to: "makes#index"
  get "/makes/:id", to: "makes#show"
  get "/cars", to: "cars#index"
end
