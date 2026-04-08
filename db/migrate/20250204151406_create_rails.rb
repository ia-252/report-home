class CreateRails < ActiveRecord::Migration[7.2]
  def change
    create_table :rails do |t|
      t.string :g
      t.string :controller
      t.string :Belong

      t.timestamps
    end
  end
end
