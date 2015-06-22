class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  load_and_authorize_resource except: [:home, :help, :about], unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private
  def admin_user
    unless current_user.is_admin?
      flash[:danger] = t "user.not_admin"
      redirect_to root_path
    end
  end
end
