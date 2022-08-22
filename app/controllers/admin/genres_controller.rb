class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :genre_find, only: [:edit, :update, :destroy]

  def index
    @genre = Genre.new
    @genres = Genre.page(params[:page])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
       redirect_to request.referer
    else
      @genres = Genre.page(params[:page])
      render :index
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render :edit
    end
  end
  def destroy
    @genre.destroy
    redirect_to request.referer
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def genre_find
    @genre = Genre.find(params[:id])
  end

end
