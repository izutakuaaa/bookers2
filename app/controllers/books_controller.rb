class BooksController < ApplicationController
   before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
    @user = current_user
    @book = Book.new


    @user_books = Book.all
  end

   def show
    @user_book = Book.find(params[:id])
    @user = @user_book.user
    @book = Book.new
    @book_comment=BookComment.new
   end



  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @user=current_user
      @user_books= Book.all

      render :index
    end
  end



  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

   private

  def book_params
    params.require(:book).permit(:title , :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end


