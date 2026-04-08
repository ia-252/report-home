class CreateReports < ActiveRecord::Migration[7.2]
  def change
    create_table :reports do |t|, force: :cascade do |t|
      t.date :classDate,null: false
      t.time :classTime, null: false
      t.boolean :done, default: false
      t.text :classSubject, null: false
      t.text :classContent, null: false
      t.text :classHomework, null: false
      t.text :classComment, null: false

      t.timestamps
    end
  end
end
