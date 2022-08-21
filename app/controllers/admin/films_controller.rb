class Admin::FilmsController < ApplicationController
  before_action :authenticate_admin!
  #before_action :film_find, only: [:show, :destroy]

  def index
    if params[:latest]
      @films = Film.latest.page(params[:page])
    elsif params[:old]
      @films = Film.old.page(params[:page])
    elsif params[:favorited_count]
      films = Film.favorited_count
      @films = Kaminari.paginate_array(films).page(params[:page])
    elsif params[:star_count]
      @films = Film.star_count.page(params[:page])
    else
      @films = Film.page(params[:page])
    end
    @film_count = Film.all
  end

  def show
    @film = Film.find(params[:id])
    @user = @film.user
  end

  def destroy
    @film = Film.find(params[:id])
    @film.destroy
    redirect_to admin_films_path
  end

  #private

  #def film_find
    #@film = Film.find(params[:id])
  #end

end
