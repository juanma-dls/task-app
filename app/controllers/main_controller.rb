class MainController < ApplicationController
  before_action :authenticate_user!
  
  def home
    @projects = Project.joins(:tasks).where(tasks: { assigned_user_id: current_user.id}).distinct
    @tasks = Task.where(assigned_user: current_user).where.not(status: "finalizado")
  end
end
