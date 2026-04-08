class CreateStudentTeachers < ActiveRecord::Migration[7.2]
  def change
    create_table :student_teachers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :user_t, null: false, foreign_key: true

      t.timestamps
    end
  end
end
