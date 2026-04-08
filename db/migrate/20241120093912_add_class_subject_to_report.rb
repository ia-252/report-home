class AddClassSubjectToReport < ActiveRecord::Migration[7.2]
  def change
    add_column :reports, :classSubject, :text
  end
end
