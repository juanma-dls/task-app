class TasksController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @task = Task.all
  end

  def new
    @task = Task.new(project_id: params[:project_id])
    @users = User.all
    session[:project_id] = params[:project_id]
  end
  
  def create
    @users = User.all
    @task = Task.new(task_params)
    @task.project_id = session[:project_id]
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'La tarea fue creada exitosamente' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
    # Eliminar de la sesion el project_id al crear la tarea
    session.delete(:project_id)
  end

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :status, :priority, :project_id, :assigned_user_id)
  end  
  
end