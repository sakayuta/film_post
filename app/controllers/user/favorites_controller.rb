class User::FavoritesController < ApplicationController

  def create
    @film = Film.find(params[:film_id])
    favorite = current_user.favorites.new(film_id: @film.id)
    favorite.save
    #redirect_to request.referer
  end

  def destroy
    @film = Film.find(params[:film_id])
    favorite = current_user.favorites.find_by(film_id: @film.id)
    favorite.destroy
   # redirect_to request.referer
  end

end
