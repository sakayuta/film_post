class User::SearchesController < ApplicationController
   before_action :authenticate_user!

  def search
    @films = Film.search(params[:keyword]).page(params[:page])
    @keyword = params[:keyword]
  end
end
