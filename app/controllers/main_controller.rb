class MainController < ApplicationController
  before_action :authenticate_user!
  
  def home
    @tasks = Task.where(assigned_user: current_user).where.not(status: "finalizado")
  end
end
