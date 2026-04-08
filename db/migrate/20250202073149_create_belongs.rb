class CreateBelongs < ActiveRecord::Migration[7.2]
  def change
    create_table :belongs do |t|
      t.string :teacherId
      t.string :studentId

      t.timestamps
    end
  end
end
