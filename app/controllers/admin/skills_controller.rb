class Admin::SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  def index
    @skills = Skill.all.paginate page: params[:page], per_page: Settings.paginate.normal
  end

  def show
  end

  def new
    @skill = Skill.new
  end

  def edit
  end

  def create
    @skill = Skill.new skill_params
    respond_to do |format|
      if @skill.save
        format.html {redirect_to [:admin, @skill], notice: t("skill.create")}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @skill.update skill_params
        format.html {redirect_to [:admin, @skill], notice: t("skill.update")}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @skill.destroy
    respond_to do |format|
      format.html {redirect_to admin_skills_url, notice: t("skill.delete")}
      format.json {head :no_content}
    end
  end

  private
  def set_skill
    @skill = Skill.find params[:id]
  end

  def skill_params
    params.require(:skill).permit :name, :description
  end
end
