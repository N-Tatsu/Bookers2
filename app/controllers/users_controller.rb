class UsersController < ApplicationController
  def index
    @current_user =  current_user
    @new_book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
    
  end

  def show
    @current_user = current_user
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
  end

  def edit
  end


  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
