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
      @genres = Genre.all
      render :new
    end
  end

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
    @genres = Genre.all
    @film_count = Film.all
  end

  def show
    @film = Film.find(params[:id])
    @user = @film.user
    @film_comment = FilmComment.new
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
      @genres = Genre.all
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
    @genre = Genre.find(params[:id])
    #@all_films_searched = Film.where(genre_id: @genre_searched.id)
    #@films = @all_films_searched.page(params[:page]).reverse_order
    @films = @genre.films.page(params[:page])
    genres_list(params)
  end

  def genres_list(params)
    if params[:latest]
      @films = @genre.films.latest.page(params[:page])
    elsif params[:old]
      @films = @genre.films.old.page(params[:page])
    elsif params[:favorited_count]
      films = @genre.films.favorited_count
      @films = Kaminari.paginate_array(films).page(params[:page])
    elsif params[:star_count]
      @films = @genre.films.star_count.page(params[:page])
    end
  end

  private

  def film_params
    params.require(:film).permit(:title, :body, :genre_id, :image, :star)
  end

end
