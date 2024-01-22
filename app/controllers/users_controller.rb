class UsersController < ApplicationController
  def index
    @book = Book.new
  end

  def create
    
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
  end


  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
