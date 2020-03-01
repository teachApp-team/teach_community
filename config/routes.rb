Rails.application.routes.draw do
  root 'home#top'
  get 'samples/hello'
  get 'samples/login_form'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
