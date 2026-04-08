class AddUserIdToReport < ActiveRecord::Migration[7.2]
  def change
    add_column :reports, :user_id, :string
  end
end
