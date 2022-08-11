class User::FilmsController < ApplicationController

  def new
    @film = Film.new
  end

  def create
    film = Film.new(film_params)
    film.user_id = current_user.id
    if film.save
      redirect_to film_path(film.id), notice: "投稿できました！"
    else
      render :new
    end
  end

  def index
    @film = Film.all
    @user = current_user
  end

  def show
    @film = Film.find(params[:id])
    @user = @film.user
  end

  def edit
    @film = Film.find(params[:id])
    if @film.user != current_user
       redirect_to films_path
    end
  end

  def update
    film = Film.find(params[:id])
    if film.update(film_params)
      redirect_to film_path(film.id), notice: "編集できました！"
    else
      render :edit
    end
  end

  def destroy
    film = Film.find(params[:id])
    film.destroy
    redirect_to films_path
  end


  private

  def film_params
    params.require(:film).permit(:title, :body, :image)
  end

end
