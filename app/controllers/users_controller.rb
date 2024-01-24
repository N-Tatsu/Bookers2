class UsersController < ApplicationController
  def index
    @user =  current_user
    @new_book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id]) 
  end
  
  def update
    @user = User.find(params[:id])
    @user.save
    redirect_to user_path(@user)
  end
  



  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
