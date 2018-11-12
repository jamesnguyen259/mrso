class UsersController < ApplicationController
   before_action :find_user, only: %i(show edit update)

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        log_in @user
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
      else
        render 'new'
      end
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      flash[:danger] = "Update failed!"
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar,
                                 :password_confirmation)
  end

  def find_user
    @user = User.find params[:id]
    return if @user
    redirect_to root_path
  end
end
