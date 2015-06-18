class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
  end

  def edit
  end

  def update
    if @user.update_attributes params_user
      respond_to do |format|
        format.html {redirect_to user_add_skills_path(@user)}
        format.js
      end
    end
  end

  private
  def params_user
    params.require(:user).permit :name, :email, :birthday, :password, :password_confirmation, skill_ids:[],
                                 userskills_attributes: [:id, :user_id, :skill_id, :level, :year, :_destroy]
  end
  
  def set_user
    @user = User.find params[:id]
  end
end
