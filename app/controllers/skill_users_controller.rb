class SkillUsersController < ApplicationController
  def show
    @user = User.find params[:user_id]
    @user.skill_users.build
    @skills = Skill.all
  end
end
