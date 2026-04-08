class RenameTypeColumnToExam < ActiveRecord::Migration[7.2]
  def change
    rename_column :exams, :type, :time
  end
end
