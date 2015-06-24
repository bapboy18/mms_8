class TeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = Team.all.paginate page: params[:page],
      per_page: Settings.paginate.normal
  end

  def show
    @team = Team.find params[:id]
    @users = @team.users
  end

  private
  def team_params
    params.require(:team).permit :name, :description, :leader, user_ids: []
  end
end
