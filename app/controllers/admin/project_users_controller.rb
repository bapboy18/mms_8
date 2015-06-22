class Admin::ProjectUsersController < ApplicationController
  before_action :set_project, only: :show

  def show
    @users = @project.project_users
  end

  private
  def set_project
    @project = ProjectUser.find params[:project_id]
  end
end
