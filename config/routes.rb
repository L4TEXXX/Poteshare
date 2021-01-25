Rails.application.routes.draw do
  root 'home#top'
  get "/login", to: 'users#login_form'
  post "/login", to: "users#login"
  resources :users

end
