class Admin::FilmsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @films = Film.all
  end

  def show
    @film = Film.find(params[:id])
    @user = @film.user
  end
  
  def destroy
    film = Film.find(params[:id])
    film.destroy
    redirect_to admin_films_path
  end
  
end
