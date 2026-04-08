class RemoveStartTimeFromReports < ActiveRecord::Migration[7.2]
  def change
    remove_column :reports, :start_time, :datetime
  end
end
