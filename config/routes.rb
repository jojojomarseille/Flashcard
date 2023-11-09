Rails.application.routes.draw do
  root to: 'pages#home'
  
  # get 'quizzs/show'
  # get 'quizzs/index'
  # get 'quizzs/create'
  # get 'quizzs/new'
  # get 'questions/show'
  # get 'questions/index'
  # get 'questions/create'
  # get 'questions/new'

  resources :questions, only: [:index, :show, :new, :create]
  
  devise_for :users, path: 'users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # devise_for :users, controllers: {
  #       sessions: 'users/sessions'
  #     }
end
