class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @films = @user.films.page(params[:page])
    films_list(params)
  end

  #show画面個人別投稿一覧(新しい順・古い順・いいね順・評価順）で表示する
  def films_list(params)
    if params[:latest]
      @films = @user.films.latest.page(params[:page])
    elsif params[:old]
      @films = @user.films.old.page(params[:page])
    elsif params[:favorited_count]
      films = @user.films.favorited_count
      @films = Kaminari.paginate_array(films).page(params[:page])
    elsif params[:star_count]
      @films = @user.films.star_count.page(params[:page])
    end
  end

  def index
    @users = User.page(params[:page])
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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
    params.require(:user).permit(:name, :name_kana, :sex, :age_group, :email, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
