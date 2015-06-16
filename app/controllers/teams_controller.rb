class TeamsController < ApplicationController
  def index
    @teams = Team.paginate page: params[:page], per_page: Settings.page.per_max
  end
end
