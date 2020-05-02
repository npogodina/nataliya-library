require "test_helper"

describe BooksController do
  describe "index" do
    it "responds to index" do
      get books_path # same as: get "/books"
      must_respond_with :success
    end
  end

  describe "show" do
    before do
      @book = Book.create(title: "Little Blue Truck")
    end

    it "shows the page for an existing book" do
      book_id = @book.id
      get "/books/#{book_id}"
      must_respond_with :success # same as: :ok
    end

    # # same as:
    # it "will get show for valid ids" do
    #   # Arrange
    #   valid_book_id = 1
  
    #   # Act
    #   get "/books/#{valid_book_id}"
  
    #   # Assert
    #   must_respond_with :success
    # end

    it "shows 404 for a non-existing book" do
      get "/books/666"
      must_respond_with :not_found # same as :missing
    end
  end
end
