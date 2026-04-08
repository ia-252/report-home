class Report < ApplicationRecord
    scope :latest, -> {order(classDate: :desc, classTime: :desc)}
    scope :old, -> {order(classDate: :asc)}
    scope :english, -> {order(english: :desc)}
    scope :math, -> {order(math: :desc)}
    scope :japanese, -> {order(japanese: :desc)}
    scope :science, -> {order(science: :desc)}
    scope :socialStudy, -> {order(socialStudy: :desc)}

    def start_time
        self.classDate
    end
    
    validate :check_classDate, on: :create
    validate :check_classDate, on: :update
      
    private
    def check_limit_time
      if classDate.present? && limit_time > Report.classDate
        errors.add(:classDate, "授業前のため入力できません")
      end
    end
  
    def report
      return Report.find_by(id: self.user_id)
    end
    
end
