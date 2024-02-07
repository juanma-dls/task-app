class Project < ApplicationRecord
  self.table_name = "projects"
  
  belongs_to :creator_user, class_name: "User", foreign_key: "creator_user_id"
  has_many :tasks

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 1000}

  enum status: {
    iniciado: 'Iniciado',
    en_desarrollo: 'En desarrollo',
    finalizado: 'Finalizado',
    pausado: 'Pausado',
    cancelado: 'Cancelado',
    pendiente_revision: 'Pendiente Revision'
  }
end