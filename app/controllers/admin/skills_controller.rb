class Admin::SkillsController < ApplicationController
  before_action :admin_user
  before_action :set_skill, only: [:edit, :update, :destroy]

  def index
    @search = Skill.search params[:q]
    @skills = @search.result
    @skills.paginate page: params[:page],
                     per_page: Settings.page.max_page
    respond_to do |format|
      format.html
      format.csv {send_data @skills.to_csv}
    end
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new skill_params
    if @skill.save
      flash[:success] = t "skill.create.success"
      redirect_to admin_skills_path
    else
      flash[:danger] = t "skill.create.danger"
      render :new
    end
  end

  def edit
  end

  def update
    if @skill.update_attributes skill_params
      flash[:success] = t "skill.update.success"
      redirect_to admin_skills_path
    else
      flash[:danger] = t "skill.update.danger"
      render :edit
    end
  end

  def destroy
    @skill.destroy
    flash[:success] = t "skill.destroy.success"
    redirect_to admin_skills_path
  end

  private
  def skill_params
    params.require(:skill).permit :id, :name
  end

  def set_skill
    @skill = Skill.find params[:id]
  end
end
