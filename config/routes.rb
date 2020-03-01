Rails.application.routes.draw do
  post 'login', to: 'sessions#create'
  delete 'logout', to:  'sessions#destroy'

  root 'home#top'
  get 'samples/hello'
  get 'samples/login_form'
  
  resources :teachers
  resources :students
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end