Rails.application.routes.draw do
  root to: 'classrooms#index'
  resources :classrooms
  resources :students
  resources :courses
end
