Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :people, defaults: { format: :json }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'healthcheck' => 'healthcheck#index'
end
