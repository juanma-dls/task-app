module UsersHelper
  def link_to_user(user, options = {})
    options = add_discontinued_class(user, options)
    link_to(user.username, user_path(user), options)
  end

  def toggle_user_activation(user)
    if user.discontinued_at
      link_to 'Activar', low_logic_user_path(user), method: :patch, data: { confirm: '¿Estás seguro?' }, class: "btn btn-sm btn-outline-success"
    else
      link_to 'Desactivar', low_logic_user_path(user), method: :patch, data: { confirm: '¿Estás seguro?' }, class: "btn btn-sm btn-outline-danger"
    end
  end
end
