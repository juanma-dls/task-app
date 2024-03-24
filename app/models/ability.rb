class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.administrador?
      can :manage, :all
    end

    if user.gestor_proyecto?
      can :manage, Task
      can :manage, Project
      can [:edit_profile, :update_profile], User, id: user.id 
    end

    if user.colaborador?
      can [:edit_profile, :update_profile], User, id: user.id
      can [:index, :show, :iniciar_finalizar_task], Task
      can :show, Project
    end

    if user.observador?
      can [:edit_profile, :update_profile], User, id: user.id
    end
  end
end
