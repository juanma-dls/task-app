class Project < ApplicationRecord
  self.table_name = "projects"
  
  has_many :users
  has_many :tasks

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 1000}
  validates :start_date, presence: true
end
