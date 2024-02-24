class Task < ApplicationRecord
  self.table_name = "tasks"

  belongs_to :project
  has_many :user_subroles
  has_many :assigned_users, through: :user_subroles, source: :user

  accepts_nested_attributes_for :user_subroles

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