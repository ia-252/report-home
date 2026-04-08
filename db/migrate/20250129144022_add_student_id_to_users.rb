class AddStudentIdToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :studrntId, :string
    add_column :users, :password_check, :string
  end
end
