class Comment < ApplicationRecord
  self.table_name = "comments"

  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :task, class_name: "Task", foreign_key: "task_id" 

  validates :content, presence: true, length: {maximum: 10000}

end