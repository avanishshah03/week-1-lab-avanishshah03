Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'books/:id/delete', to: 'books#delete', as: 'delete_book'
  root 'books#index'
  resources :books
  # Defines the root path route ("/")
  # root "articles#index"
end
