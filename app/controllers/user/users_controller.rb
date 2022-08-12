class User::UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @films = @user.films
  end

  def index
     @users = User.all
  end


  def edit
     @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "編集が完了しました"
    else
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :name_kana, :sex, :age_group, :email , :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
