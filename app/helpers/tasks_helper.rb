module TasksHelper
  def task_action_button(task)
    return unless task.assigned_user == current_user
    
    if task.no_iniciada?
      button_to("Iniciar", iniciar_finalizar_task_task_path(task), class: "btn btn-sm btn-success")
    elsif task.en_curso?
      button_to("Finalizar", iniciar_finalizar_task_task_path(task), class: "btn btn-sm btn-danger")
    elsif task.finalizado?
      content_tag(:span, "Tarea finalizada")
    elsif task.assigned_user != current_user
      content_tag(:span, "Tarea de #{current_user.name}")
    else
      content_tag(:span, "Pendiente")
    end
  end
end