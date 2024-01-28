class ApplicationController < ActionController::Base

  def redirect_based_on_authentication
    if user_signed_in?
      redirect_to "/main/home"
    else
      redirect_to "/users/sign_in"
    end
  end

end
