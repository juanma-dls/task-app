class User < ApplicationRecord
  audited

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :rol, class_name: "Rol", foreign_key: "rol_id"
  has_many :projects
  has_many :tasks

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

  validates :password, presence: true, length: { minimum: 6, maximum: 15 }, if: :should_validate_password?
  validates :password_confirmation, presence: true, length: { minimum: 6, maximum: 15 }, if: :should_validate_password?

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

  def should_validate_password?
    password.present? || password_confirmation.present?
  end

  # Sobrescribir el método de Devise
  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end

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
