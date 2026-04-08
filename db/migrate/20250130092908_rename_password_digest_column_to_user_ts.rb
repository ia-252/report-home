class RenamePasswordDigestColumnToUserTs < ActiveRecord::Migration[7.2]
  def change
    rename_column :userTs, :password_digest, :password
  end
end
