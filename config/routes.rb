Rails.application.routes.draw do
  root "courses#index"

  resources :courses do
    resources :units
  end
end
