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
  { name: "Desarrollo Front-end", description: "Responsable del desarrollo de la interfaz de usuario." },
  { name: "Desarrollo Back-end", description: "Responsable del desarrollo del servidor y la lógica de la aplicación." },
  { name: "Diseño UX/UI", description: "Responsable del diseño visual y la experiencia de usuario de la aplicación." },
  { name: "Unit Test", description: "Generación de Test para los métodos" },
  { name: "Gestor de proyecto", description: "Responsable de la planificación, organización y seguimiento del proyecto." },
  { name: "Observador", description: "Podra realizar seguimiento de la tarea sin intervenir" },
])

User.create!([
  { nombre: "Administrador", email: "juanmadls6@gmail.com", username: "administrador", password: "jmdls1997", password_confirmation: "jmdls1997", rol_id: roles.first.id }
])