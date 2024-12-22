Rails.application.routes.draw do
  root to: 'pages#home'

  resources :quizzs do
    member do
      post 'add_questions'
      get 'start'
      get 'play'
      post 'answer'
      get 'result'
    end
  end

  resources :questions, only: [:index, :show, :new, :create, :edit, :update, :destro] do
    member do
      get 'playshow'
      post 'check_answer'
    end
    collection do
      get 'index_perso'
    end 
  end

  get 'success', to: 'pages#success'
  get 'fail', to: 'pages#fail'
  
  devise_for :users, path: 'users'

end
