class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied, with: :handle_auth_error
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end

  def handle_auth_error
    respond_to do |format|
      format.html { redirect_to root_path, alert: 'You are not authorized to complete this action.' }
    end
  end

  private

  def after_sign_in_path_for(_resource)
    categories_path
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to home_index_path
    end
  end
end
