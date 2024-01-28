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

User.create!([
  { nombre: "Administrador", email: "juanmadls6@gmail.com", username: "administrador", password: "jmdls1997", rol_id: roles.first.id }
])

