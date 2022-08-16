class Admin::FilmCommentsController < ApplicationController

  def destroy
    @film = Film.find(params[:film_id])
    film_comment = FilmComment.find_by(id: params[:id], film_id: params[:film_id])
    film_comment.destroy
    #redirect_to request.referer
  end

end
