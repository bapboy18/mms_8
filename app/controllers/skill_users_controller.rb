class SkillUsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find params[:user_id]
    @skills = Skill.all
  end
end
