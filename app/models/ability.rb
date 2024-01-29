# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.administrador?
      can :manage, :all
    end

    # Gestor de Proyecto: Crear y asignar tareas, editar su perfil
    if user.gestor_proyecto?
      # can :create, Task
      # can :assign_tasks, Task # Suponiendo que haya una acción para asignar tareas
      can [:edit_profile, :update_profile], User, id: user.id # Editar su propio perfil
    end

    # Colaborador: No puede realizar acciones de usuarios, editar su perfil
    if user.colaborador?
      can [:edit_profile, :update_profile], User, id: user.id # Cambiar :edit_profile a :update_profile si es necesario
    end

    # Observador: Permisos específicos que se definirán más adelante
    if user.observador?
      can [:edit_profile, :update_profile], User, id: user.id # Editar su propio perfil
      # Define los permisos específicos para el tipo Observador cuando se definan
    end
  end
end
