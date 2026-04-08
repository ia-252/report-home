class AddClassContentToReport < ActiveRecord::Migration[7.2]
  def change
    add_column :reports, :classContent, :text
  end
end
