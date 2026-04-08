class ChangeUsersColumns < ActiveRecord::Migration[7.2]
  def change
    remove_column :usres, :teacher, :integer
    remove_column :usres, :teacherId, :integer
    remove_column :usres, :teacherId, :string
  end
end
