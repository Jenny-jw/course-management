Rails.application.routes.draw do
  root "courses#index"

  resources :courses do
    resources :units do
      collection do
        post :sort
      end
    end
  end
end
