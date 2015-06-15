class UserskillsController < ApplicationController
  def show
    @user = User.find params[:user_id]
    @user.userskills.build
    @skills = Skill.all
  end
end
