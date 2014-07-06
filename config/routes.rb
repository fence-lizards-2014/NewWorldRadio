NewWorldRadio::Application.routes.draw do
  root :to => "beats#index"
  get '/auth/beats/callback', to: 'sessions#create'
  get "/search" => "beats#search"
end
