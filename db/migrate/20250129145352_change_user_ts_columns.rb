class ChangeUserTsColumns < ActiveRecord::Migration[7.2]
  def change
    add_column :user_ts, :studentId, :string
    add_column :user_ts, :teacherId, :string
    add_column :user_ts, :password_check, :string
    remove_column :user_ts, :teacher, :string
    remove_column :user_ts, :grade, :string
  end
end
