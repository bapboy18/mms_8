class Admin::TeamUsersController < ApplicationController
  before_action :set_team

  def show
    @team_user = @team.team_users.new
    @users = User.not_in_team
    @this_team_users = @team.users
  end

  def create
    @team_user = TeamUser.new team_user_params
    if @team_user.save
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def set_team
    @team = Team.find params[:team_id]
  end

  def team_user_params
    params.require(:team_user).permit :user_id, :team_id, :joined_date
  end

  def user_params
    params.require(:team_user).permit :team_id, user_ids: []
  end
end
