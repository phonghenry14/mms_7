class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user
  
  def index
    @users = User.normal.paginate page: params[:page]
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = t("admin.edit.success")
      redirect_to admin_user_path(@user)
    else
      flash[:danger] = t("admin.edit.error")
      redirect_to admin_user_path(@user)
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t('skill.destroy.success')
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :birthday, :password, :password_confirmation, :language
  end
end
