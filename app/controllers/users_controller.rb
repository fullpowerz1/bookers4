class UsersController < ApplicationController
  # 他人のユーザー画面に編集できなくするコード
  before_action :correct_user, only: [:edit]

  def index
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end


  # 正しいユーザーのみ
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless @user == current_user
  end

end
