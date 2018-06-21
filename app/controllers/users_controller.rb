class UsersController < ApplicationController
  def show
  	@book = Book.new(book_params)
    @book.save
  end
end
