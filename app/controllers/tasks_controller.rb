class TasksController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @task = Task.all
  end

  def new
    @task = Task.new(project_id: params[:project_id])
    @users = User.all
    @subroles = Subrol.all
    session[:project_id] = params[:project_id]
  end
  
  def create
    @task = Task.new(task_params)
    @task.project_id = session[:project_id]
  
    ActiveRecord::Base.transaction do
      begin
        @task.save!
        assign_users_with_subroles
        respond_to do |format|
          format.html { redirect_to @task, notice: 'La tarea fue creada exitosamente' }
          format.json { render :show, status: :created, location: @task }
        end
      rescue ActiveRecord::RecordInvalid => e
        puts e.record.errors.full_messages
        respond_to do |format|
          format.html { render :new }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
        raise e
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
    params.require(:task).permit(:name, :description, :status, :priority, :project_id, user_subroles_attributes: [:user_id, :subrol_id])
  end

  def assign_users_with_subroles
    user_subroles = params[:task][:user_subroles_attributes]
  
    user_subroles.each do |_, attributes|
      user_id = attributes[:user_id].to_i
      subrol_id = attributes[:subrol_id].to_i
  
      @user_rol = UserSubrole.new(user_id: user_id, subrol_id: subrol_id)
      @user_rol.save
    end
  end
  
end