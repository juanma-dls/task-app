class Subrol < ApplicationRecord
  self.table_name = "subroles"
  
  has_many :tasks
  has_many :users
  
  validates :name, presence: true
end