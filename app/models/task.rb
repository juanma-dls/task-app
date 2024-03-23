class Task < ApplicationRecord
  self.table_name = "tasks"

  belongs_to :project
  belongs_to :assigned_user, class_name: "User", foreign_key: "assigned_user_id", optional: true

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 1000 }
  
  enum status: {
    iniciado: "Iniciado",
    en_desarrollo: "En desarrollo",
    finalizado: "Finalizado",
    pausado: "Pausado",
    cancelado: "Cancelado",
    pendiente_revision: "Pendiente de Revision"
  }

  enum priority: {
    urgente: "Urgente",
    alta: "Alta",
    baja: "Baja",
    muy_baja: "Muy Baja"
  }

end