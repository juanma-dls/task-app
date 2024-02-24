class MainController < ApplicationController
  before_action :authenticate_user!
  
  def home
    user_subroles = UserSubrole.where(user_id: current_user.id)
    task_ids = user_subroles.pluck(:task_id)
    @tasks = Task.where(id: task_ids)
  end
end
