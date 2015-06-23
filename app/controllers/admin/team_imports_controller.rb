class Admin::TeamImportsController < ApplicationController
  skip_load_and_authorize_resource

  def create
    Team.import params[:file]
    respond_to do |format|
      format.html {redirect_to admin_teams_url, notice: t("team.team_imported")}
    end
  end
end
