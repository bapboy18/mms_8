class Admin::SkillImportsController < ApplicationController
  skip_load_and_authorize_resource

  def create
    Skill.import params[:file]
    respond_to do |format|
      format.html {redirect_to admin_skills_url, notice: t("import.skill_imported")}
    end
  end
end
