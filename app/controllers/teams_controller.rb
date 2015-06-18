class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:edit, :update, :show]
  before_action :leader_team, only: [:edit, :update]

  def index
    @teams = Team.paginate page: params[:page], per_page: Settings.page.max_page
  end

  def show
    @leader = @team.leader
  end

  def edit
  end

  def update
    if @team.update_attributes team_params
      flash[:success] = t "leader.update.success"
      redirect_to team_path(@team)
    else
      flash[:danger] = t "leader.update.danger"
      render :edit
    end
  end

  private
  def team_params
    params.require(:team).permit :name, :description, :leader_id,
      projects_attributes: [:id, :name, :abb, :_destroy]
  end

  def set_team
    @team = Team.find params[:id]
  end
end
