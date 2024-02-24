# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

roles = Rol.create!([
  {name: "Administrador"},
  {name: "Gestor de Proyecto"},
  {name: "Colaborador"},
  {name: "Observador"}
])

Subrol.create!([
  { name: "Desarrollador Front-end", description: "Responsable del desarrollo de la interfaz de usuario." },
  { name: "Desarrollador Back-end", description: "Responsable del desarrollo del servidor y la lógica de la aplicación." },
  { name: "Diseñador UX/UI", description: "Responsable del diseño visual y la experiencia de usuario de la aplicación." },
  { name: "QA Manual", description: "Responsable de las pruebas manuales de la aplicación." },
  { name: "QA Automatización", description: "Responsable de la automatización de las pruebas de la aplicación." },
  { name: "Gestor de proyecto", description: "Responsable de la planificación, organización y seguimiento del proyecto." },
  { name: "Scrum Master", description: "Responsable de la implementación de la metodología Scrum en el proyecto." },
  { name: "Product Owner", description: "Responsable de definir la visión y las prioridades del producto." }
])

User.create!([
  { nombre: "Administrador", email: "juanmadls6@gmail.com", username: "administrador", password: "jmdls1997", password_confirmation: "jmdls1997", rol_id: roles.first.id }
])