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
  end

  # 正しいユーザーのみ
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless @user == current_user
  end

end
