class User::FilmsController < ApplicationController

  def new
    @film = Film.new
    @genres = Genre.all
  end

  def create
    @film = Film.new(film_params)
    @film.user_id = current_user.id
    if @film.save
      redirect_to film_path(@film.id), notice: "投稿できました！"
    else
      render :new
    end
  end

  def index
    @films = Film.all
    @genres = Genre.all
  end

  def show
    @film = Film.find(params[:id])
    @user = @film.user
  end

  def edit
    @film = Film.find(params[:id])
    @genres = Genre.all
    if @film.user != current_user
       redirect_to films_path
    end
  end

  def update
    @film = Film.find(params[:id])
    if @film.update(film_params)
      redirect_to film_path(@film.id), notice: "編集できました！"
    else
      render :edit
    end
  end

  def destroy
    film = Film.find(params[:id])
    film.destroy
    redirect_to films_path
  end

  def genre_search
    @genres = Genre.all
    @genre_searched = Genre.find(params[:id])
    @all_films_searched = Film.where(genre_id: @genre_searched.id)
    @films = @all_films_searched.all.reverse_order
  end

  private

  def film_params
    params.require(:film).permit(:title, :body, :genre_id, :image)
  end

end
