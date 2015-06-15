class StaticPagesController < ApplicationController
  def home
    @teams = Team.paginate page: params[:page]
    redirect_to teams_path
  end

  def help
  end

  def about
  end

  def contact
  end
end
