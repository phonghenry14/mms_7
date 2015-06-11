class Admin::TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    @teams = Team.paginate page: params[:page]
  end

  def edit
    @team = Team.find params[:id]
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new team_params
    if @team.save
      flash[:success] = t("admin.create.success")
      redirect_to admin_teams_path
    else
      flash[:danger] = t("admin.create.danger")
      render :new
    end
  end

  def update
    @team = Team.find params[:id]
    if @team.update_attributes team_params
      flash[:success] = t("admin.edit.success")
      redirect_to admin_team_path(@team)
    else
      flash[:danger] = t("admin.edit.danger")
      redirect_to admin_team_path(@team)
    end
  end

  def show
    @team = Team.find params[:id]
  end

  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = t('admin.destroy.success')
    redirect_to admin_teams_path
  end

  private
  def team_params 
    params.require(:team).permit :name, :description, :leader
  end
end
