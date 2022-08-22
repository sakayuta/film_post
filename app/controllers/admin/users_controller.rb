class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :user_find, only: [:show, :edit, :update]

  def show
  end

  def index
    @users = User.page(params[:page])
  end


  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id), notice: "変更が完了しました"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :name_kana, :sex, :age_group, :email, :is_valid)
  end

  def user_find
     @user = User.find(params[:id])
  end

end
