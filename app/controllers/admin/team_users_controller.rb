class Admin::TeamUsersController < ApplicationController
  before_action :set_team

  def show
    @team_user = @team.team_users.new
    @users = User.all
    @user = @team.team_users
  end

  private
  def set_team
    @team = Team.find params[:team_id]
  end

  def team_user_params
    params.require(:team_user).permit :user_id, :team_id, :joined_date
  end
end
