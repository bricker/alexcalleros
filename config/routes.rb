Alexcalleros::Application.routes.draw do
  root to: "home#home"
  get 'about', to: "home#about"

  namespace :admin do
    root to: "home#home"

    resources :videos, :categories, :contents

    resource :session, only: [:create, :destroy]
    get 'login' => 'sessions#new', as: "login"
    get 'logout' => 'sessions#destroy', as: "logout"
  end
end
