class Admin::SkillsController < ApplicationController
  def index
    @search = Skill.search params[:q]
    @skills = @search.result
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new skill_params
    if @skill.save
      flash[:success] = t('skill.create.success')
      redirect_to admin_skills_path
    else
      flash[:danger] = t('skill.create.danger')
      render :new
    end
  end

  def edit
    @skill = Skill.find params[:id]
  end

  def update
    @skill = Skill.find params[:id]
    if @skill.update_attributes skill_params
      flash[:success] = t('skill.update.success')
      redirect_to admin_skill_path @skill
    else
      flash[:danger] = t('skill.update.danger')
      render :edit
    end
  end

  def destroy
    Skill.find(params[:id]).destroy
    flash[:success] = t('skill.destroy.success')
    redirect_to admin_skills_path
  end

  private
  def skill_params
    params.require(:skill).permit :id, :name
  end
end
