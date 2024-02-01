class AddedNewTable < ActiveRecord::Migration[7.1]
  def change
    # Crear las tablas independientes primero
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :status, null: false
      t.timestamps
    end

    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description
      t.date :end_date
      t.string :status, null: false
      t.integer :priority
      t.decimal :estimated_time
      t.decimal :actual_time
      t.timestamps
    end

    create_table :labels do |t|
      t.string :name, null: false
      t.string :color, null: false
      t.timestamps
    end

    create_table :subroles do |t|
      t.string :name, null: false
      t.text :description
      t.timestamps
    end

    # Tabla comentarios
    create_table :comments do |t|
      t.text :content, null: false
      t.timestamps
    end

    # Tabla intermedia para la relación muchos a muchos entre tareas y etiquetas
    create_table :tasks_labels, id: false do |t|
      t.belongs_to :task, foreign_key: true
      t.belongs_to :label, foreign_key: true
    end

    # Luego agregar las columnas para las relaciones
    add_reference :projects, :creator_user, foreign_key: { to_table: :users }
    add_reference :tasks, :project, foreign_key: { to_table: :projects }
    add_reference :tasks, :assigned_user, foreign_key: { to_table: :users }
    add_reference :comments, :user, foreign_key: { to_table: :users }
    add_reference :comments, :task, foreign_key: { to_table: :tasks }
    add_reference :users, :subrole, foreign_key: true
    add_reference :tasks, :subrole, foreign_key: true

  end
end
