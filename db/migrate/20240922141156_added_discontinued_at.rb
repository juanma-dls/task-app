class AddedDiscontinuedAt < ActiveRecord::Migration[7.1]
  def self.up
    add_column :users, :discontinued_at, :boolean, default: false
    add_column :projects, :discontinued_at, :boolean, default: false

    User.update_all(discontinued_at: false)
    Project.update_all(discontinued_at: false)
  end

  def self.down
    remove_column :users, :discontinued_at
    remove_column :projects, :discontinued_at
  end
end
