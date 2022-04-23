Rails.application.routes.draw do
  devise_for :users

  resources :books, only: [:edit, :new, :index, :show, :update, :create, :destroy]

  resources :users, only: [:edit, :index, :show, :update]


  root to: "homes#top"

  get "/home/about" => "homes#about", as: "about"



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
