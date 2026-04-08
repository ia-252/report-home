class AddstudentIdToUserTs < ActiveRecord::Migration[7.2]
  def change
    add_column :user_ts, :studentId, :string
    add_column :user_ts, :password_check, :string
  end
end
