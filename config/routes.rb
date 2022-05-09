Rails.application.routes.draw do
  resources :reviews
  resources :professor_courses
  resources :professors
  resources :courses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "courses#index"
end
