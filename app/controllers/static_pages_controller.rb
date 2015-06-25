class StaticPagesController < ApplicationController
  def home
    if user_signed_in? && current_user.is_admin?
      redirect_to admin_teams_path
    elsif user_signed_in?
      redirect_to teams_path
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
