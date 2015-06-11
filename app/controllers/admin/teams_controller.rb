class Admin::TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    @teams = Team.paginate page: params[:page]
  end

  def show
    @team = Team.find params[:id]
  end

  private
  def team_params 
    params.require(:team).permit :id, :name, :desciption
  end
end
