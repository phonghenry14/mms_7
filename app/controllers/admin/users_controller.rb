class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, :admin_user

  def index
    @users = User.normal.paginate page: params[:page], per_page: Settings.page.max_page
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
    @user.user_positions.build
    @positions = Position.all
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "admin.create.success"
      redirect_to admin_users_path
    else
      flash[:danger] = t "admin.create.danger"
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
    @user_position = @user.user_positions.last
    @positions = Position.all
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = t "admin.edit.success"
      redirect_to admin_user_path @user
    else
      flash[:danger] = t "admin.edit.error"
      redirect_to admin_user_path @user
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t "admin.destroy.success"
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :birthday,
      :password, :password_confirmation, :language,
      user_positions_attributes: [:id, :user_id, :position_id]
  end
end
