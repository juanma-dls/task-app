class Rol < ApplicationRecord
  self.table_name = "roles"

  has_many :users
  validates :name, presence: true
end