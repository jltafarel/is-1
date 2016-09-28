Rails.application.routes.draw do
  root to: 'classrooms#index'
  resources :classrooms, except: [:edit, :update]
  resources :students
  resources :courses
end
