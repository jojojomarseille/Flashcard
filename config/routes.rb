Rails.application.routes.draw do
  root to: 'pages#home'

  resources :questions, only: [:index, :show, :new, :create] do
    member do
      get 'playshow'
      post 'check_answer'
    end
  end

  get 'success', to: 'pages#success'
  get 'fail', to: 'pages#fail'
  
  devise_for :users, path: 'users'

end
