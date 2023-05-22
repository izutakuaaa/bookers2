Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "homes#top"
  get "home/about", to: 'homes#about', as: :about
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create , :destroy]
  end
end

