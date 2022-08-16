class User::SearchesController < ApplicationController
   before_action :authenticate_user!

  def search
    @films = Film.search(params[:keyword])
    @keyword = params[:keyword]
  end
end
