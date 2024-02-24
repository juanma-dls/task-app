class UserSubrole < ApplicationRecord
  self.table_name = "user_subroles"
  
  belongs_to :user
  belongs_to :subrol
  belongs_to :task

end