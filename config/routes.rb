Rails.application.routes.draw do
  root 'home#top'
  get "/login", to: 'users#login_form'
  post "/login", to: "users#login"
  post "/logout", to: "users#logout"
  post "/users/:id/update" => "users#update"
  resources :users
  resources :rooms do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, only: [:index,:show, :edit, :update, :destroy]

end
