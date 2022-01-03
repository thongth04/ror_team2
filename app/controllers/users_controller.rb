class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :find_user, except: [:index]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User was updated successfully!"
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :phone, :address, :admin)
    end

    def find_user
      @user = User.find(params[:id])
    end
end
