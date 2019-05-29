Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/show'
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :qas do
    collection do
      get 'edit_all'
      get 'show_all'
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

  resources :favorites do
    collection do
      post 'favorite_like'
      post 'favorite_unlike'
    end
  end
    resources :dramas do
    collection do
      get 'edit_all'
    end
  end
  resources :episodes

  resources :admins do
    collection do
      get 'dramas_edit_all'
      get 'qas_edit_all'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
