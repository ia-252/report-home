class CreateTeacherStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :teacher_students do |t|
      t.references :user, null: false, foreign_key: true
      t.references :userT, null: false, foreign_key: true

      t.index %i[ user_id user_t_id ], unique: true

      t.timestamps

      
    end
  end
end
