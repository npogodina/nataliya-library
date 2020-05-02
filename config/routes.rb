Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # verb 'path', to: 'controller#action'
  
  # Routes that have to do with the collection of books
  get '/books', to: 'books#index', as: 'books'
  get '/books/new', to: 'books#new', as: 'new_book' # form
  post '/books', to: 'books#create'

  # Routes that deal with a specific book
  get '/books/:id', to: 'books#show', as: 'book'
  get '/books/:id/edit', to: 'books#edit', as: 'edit_book' # form
  patch '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'

  # patch '/books/:id/mark_read', to: 'books#mark_read', as: 'book_read'

end
