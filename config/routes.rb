Rails.application.routes.draw do
  
  get 'topics/index'
  get 'auth/:provider/callback', to: 'sessions#omni_create'
  
  
  post 'login', to: 'sessions#create'
  delete 'logout', to:  'sessions#destroy'

  root 'home#top'
  get 'samples/hello'
  get 'samples/login_form'
  get 'my_students/:id', to: 'teachers#my_students'
  post 'add', to: 'communities#add', as: 'add'
  
  get 'my_messages/:student_id', to: 'rooms#show'
  
  get '/producer', to: 'home#producer'
  
  get 'mypage', to: 'teachers#mypage'
  
  get 'youtube', to: 'youtube#index'
  get 'school', to: 'youtube#school'
  post 'get_videos', to: 'youtube#get_videos'
  post 'favorite_video', to: 'youtube#favorite'
  
  get 'scrape', to: "topics#scrape_all"
  
  resources :teachers
  resources :students
  resources :communities
  resources :messages

  resources :topics, only: [:index]

  resources :comments
  resources :groups

  
  # get /teachers indexアクション
  # get /teacher/:id show
  # get /new_teacher newアクション
  # post /teacher create
  # get /edit_teacher/:id edit
  # post /teacher/:id update
  # delete /teacher/:id delete
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
