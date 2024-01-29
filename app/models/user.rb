class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :rol, class_name: "Rol", foreign_key: "rol_id"
  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum:6, maximum:15}
  validates :password_confirmation, presence: true, length: {minimum:6, maximum:15}
  validates :username, presence: true, uniqueness: true
  validates :nombre, presence:true 

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

end
