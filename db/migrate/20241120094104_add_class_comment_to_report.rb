class AddClassCommentToReport < ActiveRecord::Migration[7.2]
  def change
    add_column :reports, :classComment, :text
  end
end
