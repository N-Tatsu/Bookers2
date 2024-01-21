class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user.id = current_user_id
    @book.save
    redirect_to books_path
  end
  
  def index
    
    
  end

  def show
  end
  
  def edit 
  end
end
