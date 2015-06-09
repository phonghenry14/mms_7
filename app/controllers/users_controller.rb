class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes params_user
      redirect_to user_path(@user)
    end
  end

  private
  def params_user
    params.require(:user).permit :name, :email, :birthday, :password, :password_confirmation, skill_ids:[]
  end
end
