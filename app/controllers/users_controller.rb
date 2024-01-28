class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_user, only: %i[ show edit update destroy ]

  def index 
    @users = User.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end