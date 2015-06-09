class UserskillsController < ApplicationController
  def new
    @user = User.find params[:user_id]
    @userskill = @user.userskills.new
    @skills = Skill.all
  end
end
