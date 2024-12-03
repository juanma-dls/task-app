class ChangeColumnDiscontinuedAtUser < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :discontinued_at, :datetime, null: true
    change_column :projects, :discontinued_at, :datetime, null: true
  end
end
