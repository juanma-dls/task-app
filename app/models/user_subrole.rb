class UserSubrole < ApplicationRecord
  self.table_name = "user_subroles"
  
  belongs_to :user
  belongs_to :subrol

end