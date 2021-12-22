Rails.application.routes.draw do
  resources :people, only: %i[ index show ], defaults: { format: :json }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'healthcheck' => 'healthcheck#index'
end
