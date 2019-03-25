Rails.application.routes.draw do

  devise_for :users
  # post 'books' => 'books#create'
  root 'home#top'
  resources :users
  resources :books
  get '/about' => 'home#about', as: "about"
  # get 'books/:id/edit' => 'books#edit', as: 'edit_book'
end
