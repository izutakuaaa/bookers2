class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    favorite = Favorite.find_by(user_id: current_user.id, book_id: @book.id)
    if favorite
      favorite.destroy
    else
      Favorite.create(user_id: current_user.id, book_id: @book.id)
    end
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to request.referer
  end
end
