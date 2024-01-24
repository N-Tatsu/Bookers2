class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
    
  end
  
  def index
   @user =  current_user
   @books = Book.all
   @new_book = Book.new

  end

  def show
    @user = current_user
    @new_book = Book.new
    @book = Book.find(params[:id])
    
  end

  def edit
    @book = book.find(params[:id])
  end
  
  def update
  end
  
  def destroy
    post_image = Book.find(params[:id])
    post_image.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

