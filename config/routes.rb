Alexcalleros::Application.routes.draw do
  root to: "home#home"

  namespace :admin do
    root to: "home#index"

    resources :videos, :categories, :contents

    resource :session, only: [:create, :destroy]
    get 'login' => 'sessions#new', as: "login"
    get 'logout' => 'sessions#destroy', as: "logout"
  end
end
