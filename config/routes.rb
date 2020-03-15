Rails.application.routes.draw do
  post 'login', to: 'sessions#create'
  delete 'logout', to:  'sessions#destroy'

  root 'home#top'
  get 'samples/hello'
  get 'samples/login_form'
  get 'my_students/:id', to: 'teachers#my_students'
  
  get 'my_messages/:student_id', to: 'rooms#show'
  
  
  resources :teachers
  resources :students
  resources :communities
  resources :messages
  
  # get /teachers indexアクション
  # get /teacher/:id show
  # get /new_teacher newアクション
  # post /teacher create
  # get /edit_teacher/:id edit
  # post /teacher/:id update
  # delete /teacher/:id delete
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
