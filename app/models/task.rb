class Task < ApplicationRecord
  self.table_name = "tasks"

  has_many :projects
  has_many :user_subroles
  has_many :assigned_users, through: :user_subroles, source: :user
  
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 1000 }
  validates :status, presence: true
  validates :priority, presence: true
  
end