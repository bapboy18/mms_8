class Admin::TeamUsersController < ApplicationController
  before_action :set_team

  def show
    @team_user = @team.team_users.new
    @users = User.not_in_team
    @this_team_users = @team.users
  end

  private
  def set_team
    @team = Team.find params[:team_id]
  end
end
