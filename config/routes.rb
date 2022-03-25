Rails.application.routes.draw do
  resources :persons

  get "healthcheck" => "healthcheck#index"
end
