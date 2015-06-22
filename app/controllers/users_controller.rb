class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      respond_to do |format|
        format.html {redirect_to user_skills_path(@user)}
        format.js
      end
    else
      flash[:success] = t("flash.notupdate")
    end
  end

  private
  def user_params
    params.require(:user).permit :email, :password, skill_ids: []
  end
end
