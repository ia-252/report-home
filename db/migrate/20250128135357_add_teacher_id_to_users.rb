class AddTeacherIdToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :teacherId, :integer
  end
end
