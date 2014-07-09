NewWorldRadio::Application.routes.draw do
  root :to => "songs#index"
  get "/search" => "songs#search"
end
