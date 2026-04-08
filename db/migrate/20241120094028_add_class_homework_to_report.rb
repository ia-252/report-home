class AddClassHomeworkToReport < ActiveRecord::Migration[7.2]
  def change
    add_column :reports, :classHomework, :text
  end
end
