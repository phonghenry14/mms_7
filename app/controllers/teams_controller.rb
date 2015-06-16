class TeamsController < ApplicationController
  def index
    @teams = Team.paginate page: params[:page], per_page: Settings.page.max_page
  end

  def show
    @team = Team.find params[:id]
  end

  private
  def team_params
    params.require(:team).permit :name, :description, :leader_id
  end
end
