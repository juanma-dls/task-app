class Task < ApplicationRecord
  self.table_name = "tasks"
  
  belongs_to :user, class_name: "User", foreign_key: "assigned_user_id"
  belongs_to :project, class_name: "Project", foreing_key: "project_id"
  belongs_to :subrol, class_name: "Subrol", foreing_key: "subrole_id"
  
  validates :name, presence: true
  validates :description, presence: :true, length: {maximum: 1000}
  validates :status, presence: :true
  validates :priority
end
