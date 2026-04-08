class CreateUserTs < ActiveRecord::Migration[7.2]
  def change
    create_table :user_ts do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
