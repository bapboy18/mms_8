class Admin::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.paginate page: params[:page], per_page: Settings.paginate.normal
  end

  def show
    @user = User.find params[:id]
    @positions = @user.positions
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t("flash.added")
      redirect_to admin_users_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = t("flash.update")
      redirect_to admin_users_url
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:notice] = t("flash.delete")
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit :email, :password,
      :password_confirmation, :role, position_ids: []
  end
end
