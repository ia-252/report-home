class AddDoneToReports < ActiveRecord::Migration[7.2]
  def change
    add_column :reports, :done, :boolean
  end
end
