class AddDetailsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :teacher, :string
    add_column :users, :grade, :string
    add_column :users, :teacherId, :string
  end
end
