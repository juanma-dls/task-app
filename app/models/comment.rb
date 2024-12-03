class Comment < ApplicationRecord
  self.table_name = "comments"

  has_many_attached :files

  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :task, class_name: "Task", foreign_key: "task_id" 

  validates :content, presence: true, length: {maximum: 10000}
  validate :acceptable_files

  private

  def acceptable_files
    files.each do |file|
      unless file.content_type.in?(%w[image/jpeg image/png application/pdf])
        errors.add(:files, "deben ser imágenes JPG/PNG o archivos PDF.")
      end
      if file.byte_size > 30.megabytes
        errors.add(:files, "no deben superar los 30MB.")
      end
    end
  end

end