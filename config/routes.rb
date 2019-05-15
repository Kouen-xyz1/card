Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/show'
  devise_for :users

  resources :qas do
    collection do
      get 'edit_all'
    end
  end

  resources :results do
    collection do
      get 'edit_all'
      get 'show_ok'
      get 'show_ng'
      post 'ok'
      post 'ng'
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
