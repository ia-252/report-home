class RenameTypeColumnToExams < ActiveRecord::Migration[7.2]
  def change
    rename_column :exams, :type, :examType
  end
end
