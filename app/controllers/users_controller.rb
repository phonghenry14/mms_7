class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes params_user
      respond_to do |format|
        format.html {redirect_to user_add_skills_path(@user)}
        format.js
      end
    end
  end

  private
  def params_user
    params.require(:user).permit :name, :email, :birthday, :password, :password_confirmation, skill_ids:[]
  end
end
