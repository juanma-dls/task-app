class TasksController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @task = Task.all
  end

  def new
    @task = Task.new
    @users = User.all
    @subroles = Subrol.all
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'La tarea fue creada exitosamente' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :status, :priority, user_roles_attributes: [:user_id, :subrol_id, :_destroy])
  end

  def assign_users_with_subroles
    user_ids = params[:task][:user_ids]
    subrole_ids = params[:task][:subrole_ids]

    user_ids.each_with_index do |user_id, index|
      user_subrole = UserSubroles.new(user_id: user_id, subrole_id: subrole_ids[index])
      @task.user_subroles << user_subrole
    end
  end

end