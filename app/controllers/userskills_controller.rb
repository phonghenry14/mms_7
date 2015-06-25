class UserskillsController < ApplicationController
  before_action :normal_user

  def show
    @user = User.find params[:user_id]
    @skills = Skill.all
  end
end
