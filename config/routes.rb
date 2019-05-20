Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/show'
  devise_for :users

  resources :qas do
    collection do
      get 'edit_all'
      post 'ajax_test'
      get 'show_ok'
      get 'show_ng'
      post 'ok'
      post 'ng'
    end
  end

  resources :results do
    collection do
      get 'edit_all'
      get 'show_all'
      get 'show_ok'
      get 'show_ng'
      post 'ok'
      post 'ng'
    end
  end

  resources :favorites, only: [:create, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
