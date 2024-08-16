Rails.application.routes.draw do
  root "courses#index"

  resources :courses do
    member do
      get 'showSingleCourse'
    end
  end
end
