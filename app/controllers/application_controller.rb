class ApplicationController < ActionController::Base

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Acceso denegado."
    redirect_to root_path
  end

  def redirect_based_on_authentication
    if user_signed_in?
      redirect_to "/main/home"
    else
      redirect_to "/users/sign_in"
    end
  end

end
