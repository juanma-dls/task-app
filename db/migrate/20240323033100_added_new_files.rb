class AddedNewFiles < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :nombre, :name
    rename_column :tasks, :name, :title
    add_column :tasks, :start_date, :date
    add_column :tasks, :nro, :integer
  end
end
