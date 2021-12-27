Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "api/docs"
  mount Rswag::Api::Engine => "api"

  get "healthcheck" => "healthcheck#index"
end
