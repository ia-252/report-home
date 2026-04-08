class User < ApplicationRecord
  has_secure_password
  validates :name, {presence: true,allow_nil: true}
  validates :email, {presence: true, uniqueness: true,allow_nil: true}
  validates :id, {presence: true,allow_nil: true}

  has_many :passive_relationships, class_name: "Belong", foreign_key: "teacherId", dependent: :destroy

  has_many :teachers, through: :active_relationships, source: :teacher

  def follow(teacher)
    active_relationships.create(studentId: user.studentId)
  end

  def unfollow(teacher)
    active_relationships.find_by(studentId: user.studentId).destroy
  end

  def teacher?(teacher)
    students.include?(user)
  end
  
  def user
    return UserT.where(user_id: self.id)
  end
end
