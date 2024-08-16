Rails.application.routes.draw do
  root "courses#index"

  get "/courses", to: "courses#index"
end
