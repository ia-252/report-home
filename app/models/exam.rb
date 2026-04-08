class Exam < ApplicationRecord
    scope :latest, -> {order(created_at: :desc)}
    scope :old, -> {order(created_at: :asc)}
    scope :star_count, -> {order(star: :desc)}
    scope :grade_1, ->{where grade == 1}
    scope :grade_2, ->{where grade == 2}
    scope :grade_3, ->{where grade == 3}
    scope :gradeAll, ->{order(grade: :desc)}
    scope :termAll, ->{order(term: :desc)}
    scope :firstHalf, ->{where term == 前期}
    scope :secondHalf, ->{where term == 後期}
    scope :firstSemester, ->{where term == '1学期'}
    scope :secondSemester, ->{where term == '2学期'}
    scope :thirdSemester, ->{where term == '3学期'}
    scope :examTypeAll, ->{order(term: :desc)}
    scope :midterm, ->{where examType == '中間'}
    scope :final, ->{where examType == '期末'}
    scope :standardized, ->{where examType == '実力'}
    scope :standardized, ->{where examType == '実力'}
    scope :subjectAll, ->{order(subject: :desc)}
    scope :english, ->{where subject == '英語'}
    scope :ce_1, ->{where subject == 'コミュニケーション英語Ⅰ'}
    scope :ce_2, ->{where subject == 'コミュニケーション英語Ⅱ'}
    scope :ce_3, ->{where subject == 'コミュニケーション英語Ⅲ'}
    scope :le_1, ->{where subject == '論理・表現Ⅰ'}
    scope :le_2, ->{where subject == '論理・表現Ⅱ'}
    scope :le_3, ->{where subject == '論理・表現Ⅲ'}
    scope :japanese, ->{where subject == '国語'}
    scope :mj, ->{where subject == '現代文'}
    scope :oj, ->{where subject == '古文'}
    scope :oc, ->{where subject == '漢文'}
    scope :math, ->{where subject == '数学'}
    scope :m_1, ->{where subject == '数学Ⅰ'}
    scope :m_2, ->{where subject == '数学Ⅱ'}
    scope :m_3, ->{where subject == '数学Ⅲ'}
    scope :m_a, ->{where subject == '数学A'}
    scope :m_b, ->{where subject == '数学B'}
    scope :m_c, ->{where subject == '数学C'}
    scope :m_1a, ->{where subject == '数学Ⅰ・A'}
    scope :m_2b, ->{where subject == '数学Ⅱ・B'}
    scope :m_3c, ->{where subject == '数学Ⅲ・C'}
    scope :ss, ->{where subject == '社会'}
    scope :jh_a, ->{where subject == '日本史A'}
    scope :jh_b, ->{where subject == '日本史B'}
    scope :wh_a, ->{where subject == '世界史A'}
    scope :wh_b, ->{where subject == '世界史B'}
    scope :g_a, ->{where subject == '地理A'}
    scope :g_b, ->{where subject == '地理B'}
    scope :politics, ->{where subject == '政治・経済'}
    scope :ethics, ->{where subject == '倫理'}
    scope :ep, ->{where subject == '倫理・政経'}
    scope :sc, ->{where subject == '理科'}
    scope :cb, ->{where subject == '化学基礎'}
    scope :chemistry, ->{where subject == '化学'}
    scope :bb, ->{where subject == '生物基礎'}
    scope :biology, ->{where subject == '生物'}
    scope :pb, ->{where subject == '物理基礎'}
    scope :physics, ->{where subject == '物理'}
    scope :gb, ->{where subject == '地学基礎'}
    scope :giology, ->{where subject == '地学'}
    scope :informatics, ->{where subject == '情報'}
    scope :music, ->{where subject == '音楽'}
    scope :he, ->{where subject == '家庭科'}
    scope :pe, ->{where subject == '保健・体育'}
  
  
    def exams
        return Exam.where(user_id: self.id)
    end
end
