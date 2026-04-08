class RenameStudrtIdColumnToUsers < ActiveRecord::Migration[7.2]
  def change
    rename_column :users, :studrntId, :studentId
  end
end
