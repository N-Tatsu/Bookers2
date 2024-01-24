class UsersController < ApplicationController
  def index
    @user =  current_user
    @new_book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
    redirect_to uses_path
    end
    @user = User.find(params[:id]) 
  end
  
  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
    redirect_to users_path
    end
    
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user)
    else
      render :edit
    end
  end
  



  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
