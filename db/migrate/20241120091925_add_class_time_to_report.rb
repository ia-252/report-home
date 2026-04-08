class AddClassTimeToReport < ActiveRecord::Migration[7.2]
  def change
    add_column :reports, :classTime, :time
  end
end
