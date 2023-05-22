class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book = book
    comment.save
    redirect_to book_path(book)
  end

  def destroy
    book_comment = BookComment.find(params[:id])
    book = book_comment.book
    book_comment.destroy
    redirect_to book_path(book)
  end



  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end

