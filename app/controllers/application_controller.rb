class ApplicationController < ActionController::Base
   helper :all # include all helpers, all the time
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 before_filter :configure_permitted_parameters, if: :devise_controller?
  #def current_user
  #  @current_user ||= User.find(session[:user_id]) if session[:user_id]
 # end
  
  helper_method :current_user

  #def authorize
   # redirect_to login_path, alert: "Not authorized" if current_user.nil? #relates to before filters. If user not logged in (ie, current_user = nil), then send error message if takes action not authorized to take
 # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
  end


end
