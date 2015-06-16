class Admin::TeamsController < ApplicationController
  before_action :authenticate_user!, :admin_user

  def index
    @teams = Team.paginate page: params[:page]
  end

  def show
    @team = Team.find params[:id]
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new team_params
    if @team.save
      flash[:success] = t "admin.create.success"
      redirect_to admin_teams_path
    else
      flash[:danger] = t "admin.create.danger"
      render :new
    end
  end

  def edit
    @team = Team.find params[:id]
    @no_team_users = User.normal.no_team
    @this_team_users = @team.users
  end

  def update
    @team = Team.find params[:id]
    if @team.update_attributes team_params
      flash[:success] = t "admin.edit.success"
    else
      flash[:danger] = t "admin.edit.danger"
    end
    redirect_to admin_team_path @team
  end

  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = t "admin.destroy.success"
    redirect_to admin_teams_path
  end

  private
  def team_params
    params.require(:team).permit :name, :description, :leader, user_ids: []
  end
end
