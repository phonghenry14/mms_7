class ProjectsController < ApplicationController
  before_action :set_project, :check_leader, :normal_user

  def edit
    @users = @project.team.users
  end

  def update
    if @project.update_attributes project_params
      flash[:success] = t "leader.update.success"
      redirect_to team_path @project.team
    else
      flash[:danger] = t "leader.update.danger"
      render :edit
    end
  end

  private
  def project_params
    params.require(:project).permit :name, :abb, user_ids: []
  end

  def set_project
    @project = Project.find params[:id]
  end

  def check_leader
    unless current_user.id == @project.team.leader_id
      flash[:danger] = t "check_leader.danger"
      redirect_to root_path
    end
  end
end
