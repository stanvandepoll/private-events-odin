Rails.application.routes.draw do
  get 'event/index'
  get 'event/show'
  get 'event/new'
  post 'event/create'
  get 'user/new'
  post 'user/create'
  get 'user/show'
  post 'user/login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
