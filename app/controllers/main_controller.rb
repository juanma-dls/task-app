class MainController < ApplicationController
  before_action :authenticate_user!
  
  def home
    @tasks = Task.where(assigned_user: current_user)
  end
end
