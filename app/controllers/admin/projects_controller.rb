class Admin::ProjectsController < ApplicationController
  before_action :set_project, except: [:index, :new, :create]
  before_action :authenticate_user!, :admin_user

  def index
    @projects = Project.all.paginate page: params[:page],
      per_page: Settings.paginate.normal
    respond_to do |format|
      format.html
      format.csv {send_data @projects.to_csv}
    end
  end

  def show
    @users = @project.users
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new project_params
    respond_to do |format|
      if @project.save
        format.html {redirect_to [:admin, @project], notice: t("project.create")}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update project_params
        format.html {redirect_to [:admin, @project], notice: t("project.update")}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @project.delete
    respond_to do |format|
      format.html {redirect_to admin_projects_url, notice: t("project.delete")}
      format.json {head :no_content}
    end
  end

  private
  def set_project
    @project = Project.find params[:id]
  end

  def project_params
    params.require(:project).permit :team_id, :name, :description, :start_date, :end_date
  end
end
