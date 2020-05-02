BOOKS = [
  {
    title: "The Wheel of Time",
    author: "Robert Jordan"
  },
  {
    title: "Good Food, Great Medicine",
    author: "Miles Hassell"
  },
  {
    title: "The Seven Spiritual Laws of Success",
    author: "Deepak Chopra"
  }
]

class BooksController < ApplicationController
  # list all
  def index 
    @books = Book.all
  end

  # show info about one
  def show
    # raise
    book_id = params[:id].to_i
    @book = Book.find_by(id: book_id)
    if @book.nil?
      head :not_found # only HTTP headers should be sent back (no <body, no payload)
      return
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def new
  end

  def create
  end
end
