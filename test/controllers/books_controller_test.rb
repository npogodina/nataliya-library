require "test_helper"

describe BooksController do
  describe "index" do
    it "responds to index" do
      get books_path # same as: get "/books"
      must_respond_with :success
    end
  end

  describe "show" do
    it "shows the page for an existing book" do
      get "/books/1"
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
      get "/books/5"
      must_respond_with :not_found # same as :missing
    end
  end
end
