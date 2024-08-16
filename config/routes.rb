Rails.application.routes.draw do
  root "courses#index"

  get "/courses", to: "courses#index"
  get "/courses/:id", to: "courses#showSingleCourse"
end
