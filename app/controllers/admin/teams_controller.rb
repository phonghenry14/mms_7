class Admin::TeamsController < ApplicationController
  before_action :admin_user
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.paginate page: params[:page],
                           per_page: Settings.page.max_page
  end

  def show
    @leader = @team.leader
    respond_to do |format|
      format.html
      format.csv {send_data @team.to_csv}
    end
  end

  def new
    @team = Team.new
    @leader_id = User.normal.pluck(:name, :id)
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
    @no_team_users = User.normal.no_team
    @this_team_users = @team.users
  end

  def update
    if @team.update_attributes team_params
      flash[:success] = t "admin.edit.success"
    else
      flash[:danger] = t "admin.edit.danger"
    end
    redirect_to admin_team_path @team
  end

  def destroy
    @team.destroy
    flash[:success] = t "admin.destroy.success"
    redirect_to admin_teams_path
  end

  private
  def team_params
    params.require(:team).permit :name, :description, :leader_id, user_ids: []
  end

  def set_team
    @team = Team.find params[:id]
  end
end
