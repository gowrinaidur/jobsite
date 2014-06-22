class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # If user is not authorized to access the page ,below is redirection default or back url
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to_back_or_default    
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  # Checking user is admin or not
  def authorize_admin?
    if current_user
      #authenticate_user!
      unless current_user.has_role? :admin
        flash[:error] = "You are not authorize to access this page."
        redirect_to_back_or_default
      end
    else      
      redirect_to admin_login_url
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name,:username, :email, :password, :password_confirmation,:phone)
    end
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:email,:username, :password, :password_confirmation)
    end    
  end

  # Here getting back url either redirect to session url or back or default
  def redirect_back_or_default(default = root_url)
    redirect_to(session.delete(:return_to) || request.env['HTTP_REFERER'] || default)
  end
  alias_method :redirect_to_back_or_default, :redirect_back_or_default

end