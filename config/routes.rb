NewWorldRadio::Application.routes.draw do
  root :to => "application#index"
  get "/create" => "sessions#create", as: "create"
end
