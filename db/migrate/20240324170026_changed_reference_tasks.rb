class ChangedReferenceTasks < ActiveRecord::Migration[7.1]
  def change
    remove_reference :tasks, :assigned_user, foreign_key: { to_table: :projects }
    add_reference :tasks, :assigned_user, foreign_key: { to_table: :users }
  end
end
