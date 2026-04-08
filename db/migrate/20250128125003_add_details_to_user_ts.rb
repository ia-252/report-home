class AddDetailsToUserTs < ActiveRecord::Migration[7.2]
  def change
    add_column :user_ts, :teacher, :string
    add_column :user_ts, :grade, :string
  end
end
