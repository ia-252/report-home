class UserT < ApplicationRecord
    has_secure_password
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}

    has_many :active_relationships, class_name: "Belong", foreign_key: "studentId", dependent: :destroy

    has_many :students, through: :passive_relationships, source: :student

    def follow(student)
      active_relationships.create(studentId: user.studentId)
    end
  
    def unfollow(student)
      active_relationships.find_by(studentId: user.studentId).destroy
    end
  
    def student?(student)
      students.include?(user)
    end

  def userTs
    return UserT.where(user_id: self.id)
  end
end
