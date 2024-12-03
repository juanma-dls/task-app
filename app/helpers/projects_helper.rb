module ProjectsHelper

  def link_to_project(project, options = {})
    options = add_discontinued_class(project, options)
    link_to(project.name, project_path(project), options)
  end

  def toggle_project_activation(project)
    if project.discontinued_at
      link_to 'Activar', low_logic_project_path(project), method: :patch, data: { confirm: '¿Estás seguro?' }, class: "btn btn-sm btn-outline-success"
    else
      link_to 'Desactivar', low_logic_project_path(project), method: :patch, data: { confirm: '¿Estás seguro?' }, class: "btn btn-sm btn-outline-danger"
    end
  end
end