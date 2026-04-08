class AddpasswordCheckToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :teacher, :user, :string
    add_column :teacherId, :user, :string
  end
end
