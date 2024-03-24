class MainController < ApplicationController
  before_action :authenticate_user!
  
  def home
    @projects = Project.joins(:tasks).where(tasks: { assigned_user_id: current_user.id }).distinct
    @tasks = Task.for_user(current_user).not_finished
  end
end
