class User::FilmCommentsController < ApplicationController
  
  def create
    @film = Film.find(params[:film_id])
    @film_comment = FilmComment.new(film_comment_params)
    @film_comment.user_id = current_user.id
    @film_comment.film_id = @film.id
    @film_comment.save
    #redirect_to request.referer
  end

  def destroy
    @film = Film.find(params[:film_id])
    @film_comment=FilmComment.find_by(id: params[:id], film_id: params[:film_id])
    @film_comment.destroy
    #redirect_to request.referer
  end



  private

  def film_comment_params
    params.require(:film_comment).permit(:comment)
  end
  
  
end
