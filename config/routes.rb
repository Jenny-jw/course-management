Rails.application.routes.draw do
  root "courses#index"

  resources :courses do
    resources :units do
      collection do
        patch :sort
      end
    end
  end
end
