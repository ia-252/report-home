class TeacherStudent < ApplicationRecord
  belongs_to :user
  belongs_to :user_t
end
