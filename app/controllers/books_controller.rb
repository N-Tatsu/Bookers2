class BooksController < ApplicationController
  
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
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else
      render :edit
    end
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

