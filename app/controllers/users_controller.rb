class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

 def index
    @user=current_user
    @book=Book.new
    @users=User.all
    @user_books = Book.all
 end

 def show
   @user = User.find(params[:id])
   @user_books = @user.books
   @book=Book.new
 end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(current_user)
      else
        render :edit
      end
    end



  def destroy
  end

 private
  def user_params
    params.require(:user).permit(:name, :email,:password,:introduction , :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
