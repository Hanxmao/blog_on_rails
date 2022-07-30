Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  get '/' => "posts#index", as: :root

  resources :users, only: [:new, :create, :edit]
  resource :session, only: [:new, :create, :destroy]
end
