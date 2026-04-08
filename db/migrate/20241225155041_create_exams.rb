class CreateExams < ActiveRecord::Migration[7.2]
  def change
    create_table :exams do |t|
      t.string :grade
      t.string :term
      t.string :type
      t.string :subject
      t.integer :goal
      t.integer :result
      t.integer :gap

      t.timestamps
    end
  end
end
