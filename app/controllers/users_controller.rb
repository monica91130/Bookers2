class UsersController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
  	@user = current_user
  end

  def update
    @user = current_user
    if current_user.update(user_params)
      flash[:notice] = "user info was successfully updated."
      redirect_to user_path(current_user)
    else
      @book = Book.new
      @books = @user.books
      render :edit
    end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end


  private

  def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    if @user == current_user.id
    else
      redirect_to root_path
    end
  end


end
