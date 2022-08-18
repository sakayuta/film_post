class Admin::FilmsController < ApplicationController
  before_action :authenticate_admin!
  #before_action :film_find, only: [:show, :destroy]

  def index
    @films = Film.page(params[:page])
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
