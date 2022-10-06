Rails.application.routes.draw do
  get 'rooms/index'
  get 'pages/home'
  root 'users#index'
  devise_for :users

  resources :rooms
  resources :users, only: %i[index show] do
    resources :friends, only: %i[create] do
      collection do
        get 'accept_friend'
        get 'decline_friend'
      end
    end
  end
  
  put '/users/:id', to:  'users#update_img'
  get '/saw_notification', to: 'users#saw_notification', as: 'saw_notice'

  resources :posts, only: %i[index new create show destroy] do
      resources :likes, only: %i[create]
  end
  resources :comments, only: %i[new create destroy] do
    resources :likes, only: %i[create]
  end

  #get 'user/:id', to: 'users#show', as: 'user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
