class Task < ApplicationRecord
  self.table_name = "tasks"

  before_create :generate_task_title

  belongs_to :project
  belongs_to :assigned_user, class_name: "User", foreign_key: "assigned_user_id", optional: true

  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 1000 }

  scope :not_finished, -> { where.not(status: "finalizado") }
  scope :for_user, ->(user) { where(assigned_user: user) }
  
  enum status: {
    creado: "Creado",
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

  def no_iniciada?
    self.status == "creado"
  end

  def en_curso?
    self.status != "creado" && self.status != "finalizado"
  end

  private

  def generate_task_title
    # Encuentra el último número de tarea y agrégale 1 para obtener el siguiente
    last_task_number = Task.maximum(:nro) || 0
    next_task_number = last_task_number + 1

    # Formatea el número de tarea con ceros a la izquierda para obtener cuatro dígitos
    formatted_task_number = format('%04d', next_task_number)

    # Reemplaza los espacios en blanco en el título con guiones bajos
    sanitized_title = title.gsub(/\s+/, '_')

    # Actualiza el título de la tarea con el número de tarea y el título original
    self.title = "#{formatted_task_number}-#{sanitized_title}"
    self.nro = next_task_number
  end

end