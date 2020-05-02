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

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(
      author: params[:book][:author],
      title: params[:book][:title],
      description: params[:book][:description]
    )

    if @book.save
      redirect_to books_path
      return
    else
      render :new
      return
    end
  end

  def edit
    book_id = params[:id].to_i
    @book = Book.find_by(id: book_id)
    if @book.nil?
      head :not_found # only HTTP headers should be sent back (no <body, no payload)
      return
    end
  end

  def update
    book_id = params[:id].to_i
    @book = Book.find_by(id: book_id)
    if @book.nil?
      head :not_found
      return
    elsif @book.update(
      author: params[:book][:author], 
      title: params[:book][:title], 
      description: params[:book][:description]
    )
      redirect_to books_path # go to the index so we can see the book in the list
      return
    else # save failed :(
      render :edit # show the new book form view again
      return
    end


    # @book.author = params[:book][:author]
    # @book.title = params[:book][:title]
    # @book.description = params[:book][:description]
    # @book.save
  end

  def destroy
  end
end
