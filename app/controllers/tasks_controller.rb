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

  def iniciar_finalizar_task
    task = Task.find_by(id: params[:format])
    if task.nil?
      redirect_to root_path, alert: 'No se pudo encontrar la tarea.'
      return
    end
    if task.status == "creado" && !task.start_date.present?
      iniciar_tarea(task)
    elsif task.status != "creado" && task.start_date.present?
      finalizar_tarea(task)
    else
      redirect_to root_path, alert: 'No se pudo iniciar o finalizar la tarea.'
    end
  end
  
  private
  
  def iniciar_tarea(task)
    task.start_date = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    task.status = "iniciado"
    if task.save
      redirect_to task_path(task), notice: 'Tarea iniciada.'
    else
      redirect_to task_path(task), alert: 'No se pudo iniciar la tarea.'
    end
  end
  
  def finalizar_tarea(task)
    task.end_date = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    task.status = "finalizado"
    if task.save
      redirect_to task_path(task), notice: 'Tarea finalizada.'
    else
      redirect_to task_path(task), alert: 'No se pudo finalizar la tarea.'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :priority, :project_id, :assigned_user_id)
  end  
  
end