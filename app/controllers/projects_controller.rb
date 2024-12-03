class ProjectsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    if current_user.administrador? || current_user.gestor_proyecto?
      @tasks = @project.tasks.page(params[:page]).per(10)
    else
      @tasks = @project.tasks.for_user(current_user).not_finished.page(params[:page]).per(10)
    end
  end  

  def edit
    @project = Project.find(params[:id])
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Proyecto #{@project.name} fue actualizada exitosamente" }
        format.json { render render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'El proyecto fue creado exitosamente' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def low_logic
    up_down(@project)

    action = @project.discontinued_at == true ? "desactivado" : "activado"
    redirect_to projects_path, notice: "Proyecto #{action} correctamente."
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :end_date, :status).merge(creator_user_id: current_user.id)
  end

end