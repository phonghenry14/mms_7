class UserskillsController < ApplicationController
  def show
    @user = User.find params[:user_id]
    @skills = Skill.all
  end
end
