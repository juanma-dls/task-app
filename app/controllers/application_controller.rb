class ApplicationController < ActionController::Base
  before_action :check_user_status, if: :user_signed_in?

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

  def up_down(record)
    if record.respond_to?(:discontinued_at)
      record.discontinued_at == false ? record.update_column(:discontinued_at, true) : record.update_column(:discontinued_at, false)
    else
      raise ArgumentError, "El modelo #{record.class.name} no tiene el campo discontinued_at"
    end
  end

  def check_user_status
    if current_user.discontinued_at.present?
      sign_out current_user
      redirect_to new_user_session_path, alert: "Tu cuenta ha sido desactivada."
    end
  end
  
end
