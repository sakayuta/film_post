class User::SearchesController < ApplicationController
   before_action :authenticate_user!

  def search
    films = Film.search(params[:keyword]).page(params[:page]) 
    if params[:latest]
      @films = films.latest.page(params[:page])
    elsif params[:old]
      @films = films.old.page(params[:page])
    elsif params[:star_count]
      @films = films.star_count.page(params[:page])
    else
      @films = films
    end
    @keyword = params[:keyword]
  end
end
