class AddpasswordDigestToUserTs < ActiveRecord::Migration[7.2]
  def change
    add_column :user_ts, :password_digest, :string
    remove_column :user_ts, :password_check, :string
    remove_column :user_ts, :password, :string
  end
end
