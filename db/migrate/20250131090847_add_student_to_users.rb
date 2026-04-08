class AddStudentToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :student, :boolean
  end
end
