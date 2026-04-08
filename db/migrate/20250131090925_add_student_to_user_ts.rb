class AddStudentToUserTs < ActiveRecord::Migration[7.2]
  def change
    add_column :user_ts, :student, :boolean
  end
end
