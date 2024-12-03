class CommentsController < ApplicationController
  before_action :authenticate_user! # Asegura que el usuario esté autenticado antes de realizar acciones de comentarios

  def new
    @task = Task.find(params[:task_id])
    @comment = Comment.new
  end

  # Acción para crear un nuevo comentario
  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @task, notice: 'Comentario creado correctamente.'
    else
      redirect_to @task, alert: 'Error al crear el comentario.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, files: [])
  end
end
