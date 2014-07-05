NewWorldRadio::Application.routes.draw do
  root :to => "application#index"
  get "/auth/:provider/callback" => "sessions#create", as: "create"
  get "/search" => "application#search"
  get "/auth/rdio/callback" => "sessions#create"
end
