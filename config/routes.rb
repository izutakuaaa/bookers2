Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  root to: "homes#top"
  get "home/about", to: 'homes#about', as: :about
  resources :users, only: [ :index, :show,:edit,:update,:destroy]
  resources :books
  patch 'books/:id' => 'books#update', as: 'update_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
