class AddColumnUser < ActiveRecord::Migration[7.1]
  def change
    # Crear la tabla de roles primero
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end

    # Luego agregar las columnas a la tabla de usuarios
    add_column :users, :nombre, :string, null: false
    add_column :users, :username, :string, null: false
    add_column :users, :rol_id, :bigint, null: false

    # Finalmente, agregar la clave foránea
    add_foreign_key :users, :roles, column: :rol_id, primary_key: :id, on_delete: :cascade, on_update: :cascade
  end
end
