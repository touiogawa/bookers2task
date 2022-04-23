class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @Users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = Book.where(user_id:@user)
  end

  def update
    @books = Book.all
    @user = User.find(params[:id])
    flash[:notice]= "successfully"
    if @user.update(user_params)
      redirect_to  user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end

end
