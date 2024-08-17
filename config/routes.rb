Rails.application.routes.draw do
  root "courses#index"

  resources :courses do
    resources :units, only: [:create, :edit, :update, :destroy] do
      collection do
        post :sort
      end
    end
  end
end
