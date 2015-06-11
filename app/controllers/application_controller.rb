class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  load_and_authorize_resource  except: [:home, :help, :about], unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end