class UsersController < ApplicationController
  before_action :set_user

  def show
    @teams = @user.teams
  end

  def update
    if @user.update_attributes user_params
      respond_to do |format|
        format.html {redirect_to user_skills_path(@user)}
        format.js
      end
    else
      flash[:success] = t "flash.notupdate"
    end
  end

  private
  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit :email, :password, skill_ids: [],
      skill_users_attributes: [:id, :skill_id, :level, :year, :_destroy]
  end
end
