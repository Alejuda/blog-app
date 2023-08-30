Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get "/custom_sign_out" => "devise/sessions#destroy", as: :custom_destroy_user_session
  end

  # Defines the root path route ("/")
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :new, :destroy]
      resources :likes, only: [:create]
    end
  end
end
