class User < ApplicationRecord
  audited

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :rol, class_name: "Rol", foreign_key: "rol_id"
  has_many :projects
  has_many :tasks

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6, maximum: 15 }
  validates :password_confirmation, presence: true, length: { minimum: 6, maximum: 15 }
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

  # Métodos para roles
  def administrador?
    self.rol.name == "Administrador"
  end

  def gestor_proyecto?
    self.rol.name == "Gestor de Proyecto"
  end

  def colaborador?
    self.rol.name == "Colaborador"
  end

  def observador?
    self.rol.name == "Observador"
  end

  def inactive_message
    discontinued_at.nil? ? super : :account_discontinued
  end

  private

  def invalidate_sessions
    sessions = ActiveRecord::SessionStore::Session.where("data LIKE ?", "%warden.user.user.key%")
    sessions.each do |session|
      user_id = session.data.match(/"warden.user.user.key"=>\[\[(\d+)\]/)[1].to_i
      if user_id == id
        session.destroy
      end
    end
  end
end
